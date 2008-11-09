md ket_qua
pdflatex -output-directory=ket_qua -jobname=pdflatex-mscore-sample mscore-sample.tex
latex -output-directory=ket_qua mscore-sample.tex
pdflatex -output-directory=ket_qua -jobname=pdflatex-mscore-test mscore-test.tex
latex -output-directory=ket_qua mscore-test.tex
pdflatex -output-directory=ket_qua -jobname=pdflatex-urwvn-sample urwvn-sample.tex
latex -output-directory=ket_qua urwvn-sample.tex
pdflatex -output-directory=ket_qua -jobname=pdflatex-urwvn-test urwvn-test.tex
latex -output-directory=ket_qua urwvn-test.tex
pdflatex -output-directory=ket_qua -jobname=pdflatex-vnr-sample vnr-sample.tex
latex -output-directory=ket_qua vnr-sample.tex
pdflatex -output-directory=ket_qua -jobname=pdflatex-vnr-test vnr-test.tex
latex -output-directory=ket_qua vnr-test.tex
pdflatex -output-directory=ket_qua -jobname=pdflatex-vntopia-sample vntopia-sample.tex
latex -output-directory=ket_qua vntopia-sample.tex
pdflatex -output-directory=ket_qua -jobname=pdflatex-vntopia-test vntopia-test.tex
latex -output-directory=ket_qua vntopia-test.tex
cd ket_qua
dvips mscore-sample.dvi -omscore-sample.ps
ps2pdf mscore-sample.ps dvips-mscore-sample.pdf
dvips mscore-test.dvi -omscore-test.ps
ps2pdf mscore-test.ps dvips-mscore-test.pdf
dvips urwvn-sample.dvi -ourwvn-sample.ps
ps2pdf urwvn-sample.ps dvips-urwvn-sample.pdf
dvips urwvn-test.dvi -ourwvn-test.ps
ps2pdf urwvn-test.ps dvips-urwvn-test.pdf
dvips vnr-sample.dvi -ovnr-sample.ps
ps2pdf vnr-sample.ps dvips-vnr-sample.pdf
dvips vnr-test.dvi -ovnr-test.ps
ps2pdf vnr-test.ps dvips-vnr-test.pdf
dvips vntopia-sample.dvi -ovntopia-sample.ps
ps2pdf vntopia-sample.ps dvips-vntopia-sample.pdf
dvips vntopia-test.dvi -ovntopia-test.ps
ps2pdf vntopia-test.ps dvips-vntopia-test.pdf
del /Q *.aux *.log *.out *.dvi
