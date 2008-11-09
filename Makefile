cdir=/cygdrive/c/

default: copy

copy:
	@cp -fv bin/{ctan,vnmik.*}  $(cdir)/vnmik/bin/
