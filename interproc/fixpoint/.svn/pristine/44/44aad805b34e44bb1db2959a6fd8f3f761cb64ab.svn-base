include Makefile.config

#---------------------------------------
# Directories
#---------------------------------------

SRCDIR = $(shell pwd)
#
# Installation directory
#
SITE-LIB = $(shell $(OCAMLFIND) printconf destdir)
PKG-NAME = fixpoint
SITE-LIB-PKG = $(SITE-LIB)/$(PKG-NAME)

#---------------------------------------
# CAML part
#---------------------------------------

REQ_PKG = camllib

MLMODULES = fixpointType fixpointStd fixpointGuided fixpointDyn fixpointThreshold fixpoint

MLMODULES_aux = print time sette hashhe ilist sHGraph
MLMODULES_aux := $(MLMODULES_aux:%=$(SITE-LIB)/camllib/%)

FILES_TOINSTALL = META \
	$(MLMODULES:%=%.ml) $(MLMODULES:%=%.mli) \
	$(MLMODULES:%=%.cmi) fixpoint.cma \
	$(MLMODULES:%=%.cmx) fixpoint.cmxa fixpoint.a \
	$(MLMODULES:%=%.p.cmx) fixpoint.p.cmxa fixpoint.p.a

#---------------------------------------
# Rules
#---------------------------------------

# Global rules
all: byte opt prof

byte: $(MLMODULES:%=%.cmi) fixpoint.cma
opt: $(MLMODULES:%=%.cmx) fixpoint.cmxa
prof: $(MLMODULES:%=%.p.cmx) fixpoint.p.cmxa

example.byte: example.ml
	$(OCAMLFIND) ocamlc $(OCAMLFLAGS) -o $@ example.mli $^ -package fixpoint -linkpkg

fixpoint.cma: $(MLMODULES:%=%.cmo)
	$(OCAMLFIND) ocamlc $(OCAMLFLAGS) -package $(REQ_PKG) -a $^ -o $@

fixpoint.cmxa: $(MLMODULES:%=%.cmx)
	$(OCAMLFIND) ocamlopt $(OCAMLOPTFLAGS) -package $(REQ_PKG) -a $^ -o $@

fixpoint.p.cmxa: $(MLMODULES:%=%.p.cmx)
	$(OCAMLFIND) ocamlopt -p $(OCAMLOPTFLAGS) -package $(REQ_PKG) -a $^ -o $@

META: Makefile
	/bin/rm -f META
	echo "description = \"Utility Library (including various datatypes)\"" >META
	echo "version = \"1.2.0\"" >>META
	echo "requires = \"$(REQ_PKG)\"" >>META
	echo "archive(byte) = \"fixpoint.cma\"" >>META
	echo "archive(native) = \"fixpoint.cmxa\"" >>META
	echo "archive(native,gprof) = \"fixpoint.p.cmxa\"" >>META

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

# TEX rules

dvi: fixpoint.dvi

.PHONY: fixpoint.dvi html

fixpoint.pdf: fixpoint.dvi
	$(DVIPDF) $^ $@

fixpoint.dvi: $(MLMODULES:%=%.cmi) $(MLMODULES:%=%.mli) $(MLMODULES_aux:%=%.mli)
	$(OCAMLDOC) $(REQ_PKG:%=-I $(SITE-LIB)/%) -latex -latextitle 1,chapter -latextitle 2,section -latextitle 3,subsection -latextitle 4,subsubsection -latextitle 5,paragraph -sepfiles -latex -o ocamldoc.tex $(MLMODULES:%=%.mli) $(MLMODULES_aux:%=%.mli)
	$(LATEX) fixpoint
	$(MAKEINDEX) fixpoint
	$(LATEX) fixpoint
	$(LATEX) fixpoint

html: $(MLMODULES:%=%.mli) $(MLMODULES_aux:%=%.mli)
	mkdir -p html
	$(OCAMLDOC) $(REQ_PKG:%=-I $(SITE-LIB)/%) -intro fixpoint.odoci -html -d html -colorize-code $^

homepage: html fixpoint.pdf
	latex index && bibtex index && latex index && latex index
	hyperlatex index
	scp -r index.html html fixpoint.pdf example.ml Changes presentation-fixpoint.pdf \
		salgado:/home/wwwpop-art/people/bjeannet/bjeannet-forge/fixpoint
	ssh salgado chmod -R ugoa+rx /home/wwwpop-art/people/bjeannet/bjeannet-forge/fixpoint

#--------------------------------------------------------------
# IMPLICIT RULES AND DEPENDENCIES
#--------------------------------------------------------------

.SUFFIXES: .ml .mli .cmi .cmo .cmx

#-----------------------------------
# CAML
#-----------------------------------

%.cmi: %.mli
	$(OCAMLFIND) ocamlc $(OCAMLFLAGS) -package $(REQ_PKG) -c $<

%.cmo: %.ml
	$(OCAMLFIND) ocamlc $(OCAMLFLAGS) -package $(REQ_PKG) -c $<

%.cmx: %.ml
	$(OCAMLFIND) ocamlopt $(OCAMLOPTFLAGS) -package $(REQ_PKG) -c $<

%.p.cmx: %.ml
	$(OCAMLFIND) ocamlopt -p $(OCAMLOPTFLAGS) -package $(REQ_PKG) -c -o $@ $<

.PHONY: tags TAGS
tags: TAGS
TAGS: $(MLMODULES:%=%.mli) $(MLMODULES:%=%.ml)
	ocamltags $^

.PHONY: depend
depend:
	$(OCAMLDEP) $(MLMODULES:%=%.mli) $(MLMODULES:%=%.ml) >Makefile.depend

Makefile.depend:
	$(OCAMLDEP) $(MLMODULES:%=%.mli) $(MLMODULES:%=%.ml) >Makefile.depend

-include Makefile.depend
