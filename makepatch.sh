#!/bin/bash

ddir=`pwd`/distro/
diffdir=$ddir/tmp

if [ -z "$2" ]; then
	echo "makepatch.sh <version1> <version2>"
else
	v1=$1
	v2=$2
	vv1=`echo $v1 |sed -e 's#\.##g'`
	vv2=`echo $v2 |sed -e 's#\.##g'`

	afile=''
	bfile=''

	[ -f $ddir/vnmik-$v1.zip ] && afile="vnmik-$v1.zip"
	[ -f $ddir/vnmik-$v2.zip ] && bfile="vnmik-$v2.zip"

	if [ -z $afile -o -z $bfile ]; then
		echo "cannot found $afile or $bfile"
	else

		diff_log=$diffdir/diff-$v1-$v2.log
		diff_er=$diffdir/diff-$v1-$v2.differ
		diff_rm=$diffdir/diff-$v1-$v2.removed
		patch_name=vnmik_${vv1}_${vv2}_patch

		# rm -rf $ddir/tmp/{$afile,$bfile}
		# unzip -u $ddir/$afile -d $ddir/tmp/$afile
		# unzip -u $ddir/$bfile -d $ddir/tmp/$bfile

		cd $ddir/tmp

		diff -r $afile $bfile > $diff_log

		grep '^diff -r' $diff_log \
			| gawk '{print $4}' \
			| gawk -F '.zip/vnmik/' '{print $2}' \
				> $diff_er

		grep '^Binary files' $diff_log \
			| gawk '{print $5}'\
			| gawk -F '.zip/vnmik/' '{print $2}' \
			>> $diff_er

		grep "^Only in vnmik-$v2.zip" $diff_log >> $diff_er
		sed -i 's#Only in ##g' $diff_er
		sed -i 's#: #/#g' $diff_er
		sed -i 's#vnmik-'$v2'.zip/vnmik/##g' $diff_er

		grep "^Only in vnmik-$v1.zip" $diff_log > $diff_rm
		if [ $? -eq 0 ]; then
			script=z.$patch_name

			sed -i 's#Only in ##g' $diff_rm
			sed -i 's#: #/#g' $diff_rm
			sed -i 's#vnmik-'$v1'.zip/vnmik/##g' $diff_rm

			echo "${patch_name}_install() {" > $script

			for f in `cat $diff_rm`; do
				echo "stat_log going to remove $f" >> $script
				echo "rm \$PREFIX/$f" >> $script
			done
			echo "}" >> $script
			echo "${patch_name}_update() {" >> $script
			echo "echo -ne ''" >> $script
			echo "}" >> $script
			echo "${patch_name}_test() {" >> $script
			echo "echo -ne ''" >> $script
			echo "}" >> $script
			cp $script $ddir/tmp/$bfile/vnmik/vnmik.log
			echo vnmik/vnmik.log/z.$patch_name >> $diff_er
		fi

		cd $ddir/tmp/$bfile/vnmik
		tar cfvj $ddir/$patch_name.4 `cat $diff_er`

	fi
fi
