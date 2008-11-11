rcdir=/cygdrive/c/vnmik/
version=4.0.1
debug=echo

default: copy

copy:
	@cp -ufv bin/{ctan,vnmik.*} $(rcdir)/bin/
	@cp -ufv vnmik.log/{VERSION,z.*} $(rcdir)/vnmik.log/
	@cp -ufv tex.doc/test/*.tex $(rcdir)/tex.doc/test
	@cp -ufv tex.doc/vntex/*.pdf $(rcdir)/tex.doc/vntex/
	@cp -ufv *.bat $(rcdir)/
	@rm -fv $(rcdir)/vnmik.log/z.vnmik_test

copy_hard:
	@cp -ufv bin/*.* $(rcdir)/bin/
	@mkdir -p $(rcdir)/bin/{libs,dlls}
	@cp -urfv bin/dlls/* $(rcdir)/bin/dlls
	@cp -urfv bin/libs/* $(rcdir)/bin/libs
	@rm -rfv $(rcdir)/bin/{dlls,libs}/.svn
	
cleanup_before:
	@rm -rfv $(rcdir)/tex.doc/{vntex,test}
	@rm -rfv $(rcdir)/vnmik.log/*
	@mkdir -p $(rcdir)/tex.doc/{test,vntex}

cleanup_after:
	@rm -fv $(rcdir)/{setup.bat,user.cfg.bat,.bash_history}
	@rm -rfv $(rcdir)/bin/{old,svn}
	@rm -fv $(rcdir)/bin/*svn*
	@rm -fv $(rcdir)/bin/vntex-update-maps
	
	@rm -fv $(rcdir)/tex.var/fontconfig/cache/*
	@rm -rfv $(rcdir)/tex.var/fonts/pk/*
	@rm -fv $(rcdir)/tex.var/miktex/config/*
	# @rm -fv $(rcdir)/tex.base/miktex/bin/*
	@rm -fv $(rcdir)/tex.doc/vntex/*min*
	@rm -fv $(rcdir)/tex.doc/vntex/*print*
	
distro: cleanup_before copy copy_hard cleanup_after

makezip:
	cd $(rcdir)/.. && zip -9r vnmik-$(version).zip vnmik/*
	