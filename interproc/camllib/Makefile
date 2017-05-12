include Makefile.config

#---------------------------------------
# Directories
#---------------------------------------

SRCDIR = $(shell pwd)
#
# Installation directory
#
SITE-LIB = $(shell $(OCAMLFIND) printconf destdir)
PKG-NAME = camllib
SITE-LIB-PKG = $(SITE-LIB)/$(PKG-NAME)

#---------------------------------------
# Files
#---------------------------------------

MLMODULES = \
	print sette pSette mappe pMappe hashhe pHashhe \
	setteI setteS mappeI mappeS hashheI hashheIB hashheS \
	dMappe pDMappe dHashhe pDHashhe \
	setList multiSetList \
	ilist fGraph1 fGraph sHGraph pSHGraph symbol union \
	statistic time rational parse

FILES_TOINSTALL = META \
	$(MLMODULES:%=%.ml) $(MLMODULES:%=%.mli) \
	$(MLMODULES:%=%.cmi) camllib.cma \
	$(MLMODULES:%=%.cmx) camllib.cmxa camllib.a \
	$(MLMODULES:%=%.p.cmx) camllib.p.cmxa camllib.p.a

all: byte opt prof

byte: $(MLMODULES:%=%.cmi) camllib.cma
opt: $(MLMODULES:%=%.cmx) camllib.cmxa
prof: $(MLMODULES:%=%.p.cmx) camllib.p.cmxa

camllib.cma: $(MLMODULES:%=%.cmo)
	$(OCAMLC) $(OCAMLFLAGS) -a $^ -o $@

camllib.cmxa: $(MLMODULES:%=%.cmx)
	$(OCAMLOPT) $(OCAMLOPTFLAGS) -a $^ -o $@

camllib.p.cmxa: $(MLMODULES:%=%.p.cmx)
	$(OCAMLOPT) -p $(OCAMLOPTFLAGS) -a $^ -o $@

install: $(FILES_TOINSTALL)
	$(OCAMLFIND) remove $(PKG-NAME)
	$(OCAMLFIND) install $(PKG-NAME) $^

uninstall:
	$(OCAMLFIND) remove $(PKG-NAME)

distclean: clean
	/bin/rm -f Makefile.depend TAGS

clean:
	/bin/rm -f *.cm[ioxat] *.cmti *.o *.a *.cmxa *.annot *.html *.ps *.pdf *.dvi *.out
	/bin/rm -f *.aux *.bbl *.blg *.dvi *.pdf *.log *.toc *.idx *.ilg *.ind ocamldoc*.tex ocamldoc.sty
	/bin/rm -fr html

wc: $(SRC)
	wc $^

tar: $(SRC) Makefile Makefile.config.model camllib.tex camllib.pdf README
	@echo "*** Archiving source files in ~/camllib.tgz ***"
	(cd ..; tar zcf $(HOME)/camllib.tgz $(^:%=camllib/%))
	@echo "*** Files archived in ~/camllib.tgz ***"

# TEX rules
.PHONY: camllib.dvi camllib.pdf html depend

camllib.pdf: camllib.dvi
	$(DVIPDF) camllib.dvi camllib.pdf

camllib.dvi: $(MLMODULES:%=%.mli) $(MLMODULES:%=%.cmi)
	$(OCAMLDOC) -latextitle 1,chapter -latextitle 2,section -latextitle 3,subsection -latextitle 4,subsubsection -latextitle 5,paragraph -noheader -notrailer -latex -o ocamldoc.tex $(MLMODULES:%=%.mli)
	$(LATEX) camllib
	$(MAKEINDEX) camllib
	$(LATEX) camllib
	$(LATEX) camllib

html: $(MLMODULES:%=%.mli) $(MLMODULES:%=%.cmi)
	mkdir -p html
	$(OCAMLDOC) -html -d html -colorize-code -intro camllib.odoci $(MLMODULES:%=%.mli)

dot: $(MLMODULES:%=%.mli)
	$(OCAMLDOC) -dot -dot-reduce -o camllib.dot $^

homepage: html camllib.pdf
	hyperlatex index
	scp -r index.html html camllib.pdf \
		avedon:/home/wwwpop-art/people/bjeannet/bjeannet-forge/camllib
	ssh avedon chmod -R ugoa+rx /home/wwwpop-art/people/bjeannet/bjeannet-forge/camllib

.SUFFIXES: .ml .mli .cmo .cmi .cmx .mll .mly .dvi .tex .ps

%.cmi: %.mli
	$(OCAMLC) $(OCAMLFLAGS) -c $(SRCDIR)/$<
%.cmo: %.ml %.cmi
	$(OCAMLC) $(OCAMLFLAGS) -c $(SRCDIR)/$<
%.cmx: %.ml %.cmi
	$(OCAMLOPT) $(OCAMLOPTFLAGS) -c $(SRCDIR)/$<
%.p.cmx: %.ml %.cmi
	$(OCAMLOPT) -p $(OCAMLOPTFLAGS) -c -o $@ $(SRCDIR)/$<

.PHONY: tags TAGS
tags: TAGS
TAGS: $(MLMODULES:%=%.mli) $(MLMODULES:%=%.ml)
	ocamltags $^

Makefile.depend depend:
	$(OCAMLDEP) $(MLMODULES:%=%.ml) $(MLMODULES:%=%.mli) > Makefile.depend

-include Makefile.depend
