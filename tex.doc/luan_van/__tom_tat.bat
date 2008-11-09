@echo off
md ket_qua 2>error.log
md tmp 2>error.log
echo \def\ImagePathPrefix{../hinh_anh} > iprefix.cfg
latex -output-directory=tmp tom_tat.tex
del /Q iprefix.cfg
cd tmp
dvips -ta5 tom_tat.dvi -otmp0.ps
psbook -q tmp0.ps tmp1.ps
psnup -2 -Pa5 -pa4 tmp1.ps tmp2.ps
ps2pdf -sPAPERSIZE#a4 tmp2.ps ..\ket_qua\tom_tat.pdf
ps2pdf -sPAPERSIZE#a4 tmp0.ps ..\ket_qua\tom_tat_2.pdf
cd ..
