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

.PHONY: norbert
norbert:
	cd ../$@/doc && make clean && make html
	cp ../$@/doc/*.html $@/

.PHONY: clicraft
clicraft:
	cd ../$@ && autoconf && ./configure && make clean && make html
	cp ../$@/doc/*.html $@/
	
# vim: set ft=make:
