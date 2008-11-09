latex -src-specials gastex
latex beamer.tex
dvips gastex.dvi
dvips beamer.dvi
ps2pdf gastex.ps
ps2pdf beamer.ps
del /Q *.aux *.log *.out *.nav beamer.dvi *.toc *.ps *.snm
