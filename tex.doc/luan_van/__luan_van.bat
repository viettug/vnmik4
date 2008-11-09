@echo off
md tmp 2>error.log
md ket_qua 2>error.log
echo \def\ImagePathPrefix{../hinh_anh} > iprefix.cfg
latex -output-directory=tmp luan_van.tex
bibtex -include-directory=tmp luan_van
latex -output-directory=tmp luan_van.tex
latex -output-directory=tmp luan_van.tex
del /Q iprefix.cfg
cd tmp
dvipdfmx -s 1  luan_van.dvi
cp luan_van.pdf ..\ket_qua\trang_bia.pdf
dvipdfmx -s 2-  luan_van.dvi
cp luan_van.pdf ..\ket_qua\luan_van.pdf
cd ..
