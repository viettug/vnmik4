#!/bin/bash

ddir=`pwd`/distro/
diffdir=$ddir/tmp

if [ -z "$2" ]; then
	echo "makepatch.sh <version1> <version2>"
else
	v1=$1
	v2=$2
	afile=''
	bfile=''
	[ -f $ddir/vnmik-$v1.zip ] && afile="vnmik-$v1.zip"
	[ -f $ddir/vnmik-$v2.zip ] && bfile="vnmik-$v2.zip"
	if [ -z $afile -o -z $bfile ]; then
		echo "cannot found $afile or $bfile"
	else
		rm -rf $ddir/tmp/{$afile,$bfile}
		# mkdir -p $ddir/tmp/{$afile,$bfile}
		unzip -u $ddir/$afile -d $ddir/tmp/$afile
		unzip -u $ddir/$bfile -d $ddir/tmp/$bfile
		cd $ddir/tmp
		diff -r $afile $bfile > $diffdir/diff-$v1-$v2.log
		grep 'diff -r' $diffdir/diff-$v1-$v2.log \
			| gawk '{print $4}' \
			| gawk -F '.zip/vnmik/' '{print $2}' \
			> $diffdir/diff-$v1-$v2.log.A
		cd $ddir/tmp/$bfile/vnmik
		tar cfvj $ddir/vnmik-$v1-$v2-patch.4 `cat $diffdir/diff-$v1-$v2.log.A`
	fi
fi
