# Makefile written by kyanh at o2 dot pl

default:
	@echo "Hello, world!"
batfiles:
	@echo 'md tmp' > test.bat
	@for f in *.tex; do \
		echo pdflatex -output-directory=tmp -jobname=pdflatex-`basename $$f .tex` $$f >> test.bat; \
		echo latex -output-directory=tmp $$f >> test.bat; \
	done
	@echo 'cd tmp' >> test.bat
	@for f in *.tex; do \
		echo dvips `basename $$f .tex`.dvi -o`basename $$f .tex`.ps >> test.bat; \
		echo ps2pdf `basename $$f .tex`.ps dvips-`basename $$f .tex`.pdf >> test.bat; \
	done
	@echo 'del /Q *.aux *.log *.out *.dvi' >> test.bat
