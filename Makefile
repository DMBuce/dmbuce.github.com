builddir = /tmp/build

%.1.html: %.1.txt
	asciidoc -a toc -a icons -a max-width=960px -d manpage $<
                                                                            
%.5.html: %.5.txt                                                   
	asciidoc -a toc -a icons -a max-width=960px -d manpage $<

%.html: %.txt
	asciidoc -a toc -a icons -a max-width=960px $<

.PHONY: all
all: 404.html

.PHONY: everything
everything: all norbert clicraft mcexplore mtg noedia dmtools

clean:
	rm -f index.html 404.html

$(builddir):
	mkdir -p $@
	chown `id -u` $@
	chmod 755 $@

.PHONY: norbert
norbert: $(builddir)
	./update-norbert.sh $(builddir)
	cp $(builddir)/$@/doc/*.html $@/

.PHONY: clicraft
clicraft: $(builddir) norbert mcexplore
	./update-clicraft.sh $(builddir)
	cp $(builddir)/$@/doc/*.html $@/
	cp mcexplore/mcexplore.1.html clicraft
	cp norbert/vinbt.1.html clicraft

.PHONY: mcexplore
mcexplore: $(builddir)
	./update-mcexplore.sh $(builddir)
	cp $(builddir)/$@/*.html $@/

.PHONY: mtg
mtg: $(builddir)
	./update-mtg.sh $(builddir)
	cp $(builddir)/$@/*.html $@/
	cp $(builddir)/$@/edh/*.html $@/edh
	cp $(builddir)/$@/leg/*.html $@/leg

.PHONY: noedia
noedia: $(builddir)
	./update-noedia.sh $(builddir)
	cp $(builddir)/$@/setting/*.html $@/
	cp $(builddir)/$@/setting/*.css $@/
	cp $(builddir)/$@/setting/*.png $@/
	cp $(builddir)/$@/setting/*.js $@/
	mkdir -p $@/img $@/thumb
	cp $(builddir)/$@/setting/img/* $@/img/
	cp $(builddir)/$@/setting/thumb/* $@/thumb/

.PHONY: dmtools
dmtools: $(builddir)
	./update-dmtools.sh $(builddir)
	cp $(builddir)/$@/* $@/

# vim: set ft=make:
