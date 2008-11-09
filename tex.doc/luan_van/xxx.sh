#!bash

echo "getting list of tex files..."

ls -d chuong* > tmp/ch1.txt
xsort tmp/ch1.txt > tmp/ch2.txt

echo "% tËp tin nµy ®­îc tù ®éng sinh ra %" > tmp/ch3.txt
echo "% ®õng söa nã; sö dông ch­¬ng tr×nh ___xxx.bat %" >> tmp/ch3.txt

for chapter in `cat tmp/ch2.txt`; do
	for texfile in `ls $chapter/*.tex 2> /dev/null`; do
		echo "\\input{$texfile}" >> tmp/ch3.txt
	done
done

echo "\\endinput" >> tmp/ch3.txt

cp tmp/ch3.txt  all.tex

echo "everyting is done"

echo "making bounding box files..."
cd hinh_anh
for f in *.{jpg,eps,png,gif}; do
	ebb $f
done
echo "everyting is done"
echo 'press any key to continue (timeout: 5 seconds)'
read -n 1 -t 5
