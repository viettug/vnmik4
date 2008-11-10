rcdir=/cygdrive/c/vnmik/
version=4.0.1
debug=echo

default: copy

copy:
	@cp -fv bin/{ctan,vnmik.*} $(rcdir)/bin/
	@cp -fv vnmik.log/{VERSION,z.*} $(rcdir)/vnmik.log/
	@cp -fv tex.doc/test/*.tex $(rcdir)/tex.doc/test
	@cp -fv tex.doc/vntex/*.pdf $(rcdir)/tex.doc/vntex/

copy_hard:
	@cp -rfv bin/* $(rcdir)/bin/
	
cleanup_before:
	@rm -fv $(rcdir)/tex.doc/{tex,vntex}
	@rm -fv $(rcdir)/vnmik.log/*

cleanup_after:
	@rm -fv $(rcdir)/{setup.bat,user.cfg.bat,.bash_history}
	@rm -fv $(rcdir)/bin/{old,svn}
	@rm -fv $(rcdir)/tex.var/*
	
distro: cleanup_before copy copy_hard cleanup_after makezip

makezip:
	cd $(rcdir)/.. && \
		$(debug) zip -9r vnmik-$(version).zip vnmik/*
