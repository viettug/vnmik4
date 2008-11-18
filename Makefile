rcdir=$(HOME)/vnmik/
rddir=$(HOME)/vnmik-devel/
distrodir=$(rddir)/distro
version=$$(grep 'export VERSION=' $(rddir)/bin/vnmik.configuration | gawk -F'=' '{print $$2}')
debug=echo

default:
	@grep -E '^[a-z]+:' ./Makefile

copy: # copy files from vnmik-devel to vnmik/
	@cp -ufv bin/{ctan,vnmik.*} $(rcdir)/bin/
	@cp -ufv vnmik.log/{VERSION,z.*} $(rcdir)/vnmik.log/
	@cp -ufv tex.doc/test/*.tex $(rcdir)/tex.doc/test
	@cp -ufv tex.doc/vntex/*.pdf $(rcdir)/tex.doc/vntex/
	@cp -ufv *.bat $(rcdir)/
	@rm -fv $(rcdir)/vnmik.log/z.vnmik_test
	@cp -ufv distro/vntex.sty $(rcdir)/tex.user/tex/latex/vntex
	@cp -ufv vnmik.doc/ReadMe.png $(rcdir)/

copy_hard: # hard copy files from bin directory
	@cp -ufv bin/*.* $(rcdir)/bin/
	@mkdir -p $(rcdir)/bin/{libs,dlls}
	@cp -urfv bin/dlls/* $(rcdir)/bin/dlls
	@cp -urfv bin/libs/* $(rcdir)/bin/libs
	@rm -rfv $(rcdir)/bin/{dlls,libs}/.svn

cleanup_before: # delete some simple files
	@rm -rfv $(rcdir)/tex.doc/{vntex,test}
	@rm -rfv $(rcdir)/vnmik.log/*
	@mkdir -p $(rcdir)/tex.doc/{test,vntex}
	@find $(rcdir) -name "*~" | xargs rm -fv

cleanup_after: # delete all unnecessary files
	@rm -fv $(rcdir)/{setup.bat,user.cfg.bat,.bash_history,Makefile}
	@rm -rfv $(rcdir)/bin/{old,svn}
	@rm -fv $(rcdir)/bin/*svn*
	@rm -fv $(rcdir)/bin/vntex-update-maps

	@rm -fv $(rcdir)/tex.var/fontconfig/cache/*
	@rm -rfv $(rcdir)/tex.var/fonts/pk/*
	@rm -fv $(rcdir)/tex.var/miktex/config/*
	# @rm -fv $(rcdir)/tex.base/miktex/bin/*
	@rm -fv $(rcdir)/tex.doc/vntex/*min*
	@rm -fv $(rcdir)/tex.doc/vntex/*print*

distro: cleanup_before copy copy_hard cleanup_after chmod version

version:
	@grep 'export VERSION' $(rddir)/bin/vnmik.configuration > vnmik.log/VERSION

testversion:
	@echo $(version)

chmod:
	@cd $(rcdir) && 0cm 644 755 . -v

zip:
	@rm -fv $(distrodir)/vnmik-$(version).zip
	cd $(rcdir)/.. && \
		zip -9r $(distrodir)/vnmik-$(version).zip vnmik/* -x "*~"

fzip:
	@rm -fv $(distrodir)/vnmik-$(version).zip
	cd $(rcdir)/.. && \
		zip -0r $(distrodir)/vnmik-$(version).zip vnmik/* -x "*~"

md5sum:
	@md5sum $(distrodir)/vnmik-$(version).zip > $(distrodir)/vnmik-$(version).zip.md5sum

updistro: md5sum
	 @rsync -avP -e 'ssh -i /home/users/kyanh/.ssh/sf2008' \
	 	$(distrodir)/vnmik-$(version).zip* \
	 	kyanh@frs.sourceforge.net:uploads/

upweb:
	@scp -i /home/users/kyanh/.ssh/sf2008 \
		site/{index.php,readme.html,download.php} \
		kyanh,vnmik@web.sourceforge.net:/home/groups/v/vn/vnmik/htdocs/

upall: upweb updistro

	# end of file
