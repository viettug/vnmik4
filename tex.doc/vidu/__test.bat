latex -src-specials size13.tex
latex -src-specials vidu0.tex
pdflatex pdfbookmark.tex
pdflatex pdfbookmark.tex
del /Q *.aux *.out *.log
