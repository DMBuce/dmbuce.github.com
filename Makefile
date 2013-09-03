builddir = /tmp/build

%.1.html: %.1.txt
	asciidoc -a toc -a icons -a max-width=960px -d manpage $<
                                                                            
%.5.html: %.5.txt                                                   
	asciidoc -a toc -a icons -a max-width=960px -d manpage $<

%.html: %.txt
	asciidoc -a toc -a icons -a max-width=960px $<

.PHONY: all
all: index.html 404.html

.PHONY: everything
everything: all norbert clicraft

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
clicraft: $(builddir)
	./update-clicraft.sh $(builddir)
	cp $(builddir)/$@/doc/*.html $@/
	
# vim: set ft=make:
