rcdir=/cygdrive/c/vnmik/

default: copy

copy:
	@cp -fv bin/{ctan,vnmik.*} $(rcdir)/bin/
	@cp -fv vnmik.log/z.* $(rcdir)/vnmik.log/
