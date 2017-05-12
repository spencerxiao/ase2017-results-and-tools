include Makefile.config
PKGNAME = mlgmpidl
VERSION_STR = 20150921


#---------------------------------------
# Directories
#---------------------------------------

SRCDIR = $(shell pwd)
#
# Installation directory
#
PREFIX = $(MLGMPIDL_PREFIX)

ifeq ($(OCAMLFIND),)
OCAMLCCOPT = -ccopt -L$(MLGMPIDL_PREFIX)
else
SITE-LIB = $(shell $(OCAMLFIND) printconf destdir)
PKG-NAME = gmp
SITE-LIB-PKG = $(SITE-LIB)/$(PKG-NAME)
REQ_PKG = bigarray

OCAMLCCOPT = -ccopt -L$(SITE-LIB)/stublibs -ccopt -L$(SITE-LIB-PKG)
endif


#---------------------------------------
# CAML part
#---------------------------------------


OCAMLCCOPT += \
-ccopt -L$(CAMLIDL_PREFIX)/lib/ocaml \
-ccopt -L$(CAML_PREFIX)/lib/ocaml \
-ccopt -L$(GMP_PREFIX)/lib \
-ccopt -L$(MPFR_PREFIX)/lib

IDLMODULES = mpz mpq mpf mpfr gmp_random
MLMODULES = $(IDLMODULES) mpzf mpqf mpfrf

#---------------------------------------
# C part
#---------------------------------------

ICFLAGS = \
-I$(GMP_PREFIX)/include \
-I$(MPFR_PREFIX)/include \
-I$(CAML_PREFIX) -I$(CAMLIDL_PREFIX)

LDFLAGS = \
-L$(GMP_PREFIX)/lib \
-L$(MPFR_PREFIX)/lib \
-L$(CAML_PREFIX) -L$(CAML_PREFIX)/stublibs -L$(CAMLIDL_PREFIX)

CCMODULES = $(IDLMODULES:%=%_caml) gmp_caml

CCLIB = libgmp_caml.a libgmp_caml.p.a
ifneq ($(HAS_SHARED),)
CCLIB += dllgmp_caml.so
endif

ifneq ($(HAS_OCAMLOPT),)
MLLIBx = \
	$(MLMODULES:%=%.cmx) gmp.cmxa gmp.a \
	$(MLMODULES:%=%.p.cmx) gmp.p.cmxa gmp.p.a
endif

FILES_TOINSTALL = \
	META \
	gmp_caml.h \
	$(IDLMODULES:%=%.idl) \
	$(MLMODULES:%=%.ml) $(MLMODULES:%=%.mli) \
	$(MLMODULES:%=%.cmi) gmp.cma \
	$(MLLIBx) \
	$(CCLIB)

ifneq ($(HAS_TYPEREX),)
FILES_TOINSTALL += $(MLMODULES:%=%.cmt) $(MLMODULES:%=%.cmti)
endif

#---------------------------------------
# Rules
#---------------------------------------

all: byte opt prof

byte: $(MLMODULES:%=%.cmi) gmp.cma
opt: $(MLMODULES:%=%.cmx) gmp.cmxa
prof: $(MLMODULES:%=%.p.cmx) gmp.p.cmxa

# Example of compilation command with ocamlfind
%.byte: %.ml
	$(OCAMLFIND) ocamlc $(OCAMLFLAGS) -o $@ $*.ml \
	-package gmp -linkpkg
%.opt: %.ml
	$(OCAMLFIND) ocamlopt -verbose $(OCAMLOPTFLAGS) -o $@ $*.ml \
	-package gmp -linkpkg
# without ocamlfind
session.byte: session.ml gmp.cma
	$(OCAMLC) -I $(PREFIX)/lib -o $@ bigarray.cma gmp.cma $<
session.opt: session.ml gmp.cmxa
	$(OCAMLOPT) -I $(PREFIX)/lib -cclib -L. -o $@ bigarray.cmxa gmp.cmxa $<
# and with noautolink
session2.opt: session.ml
	$(OCAMLOPT) -noautolink -I$(SITE-LIB-PKG) -o $@ bigarray.cmxa gmp.cmxa $<
	$(OCAMLCCOPT) -cclib "-lgmp_caml -lmpfr -lgmp -lbigarray -lcamlidl"

# CAML gmp
ifeq ($(OCAMLFIND),)
gmp.cma: $(MLMODULES:%=%.cmo) $(CCLIB)
	$(OCAMLC) $(OCAMLFLAGS) -a -o $@ $(MLMODULES:%=%.cmo) \
	-dllib -lgmp_caml $(OCAMLCCOPT) \
	-cclib -lgmp_caml -cclib -lmpfr -cclib -lgmp -cclib -lcamlidl

gmp.cmxa: $(MLMODULES:%=%.cmx) $(CCLIB)
	$(OCAMLOPT) $(OCAMLOPTFLAGS) -a -o $@ $(MLMODULES:%=%.cmx) \
	$(OCAMLCCOPT) \
	-cclib -lgmp_caml -cclib -lmpfr -cclib -lgmp -cclib -lcamlidl

gmp.p.cmxa: $(MLMODULES:%=%.p.cmx) $(CCLIB)
	$(OCAMLOPT) -p $(OCAMLOPTFLAGS) -a -o $@ $(MLMODULES:%=%.p.cmx) \
	$(OCAMLCCOPT) \
	-cclib -lgmp_caml -cclib -lmpfr -cclib -lgmp -cclib -lcamlidl
else
gmp.cma: $(MLMODULES:%=%.cmo) $(CCLIB)
	$(OCAMLFIND) ocamlc $(OCAMLFLAGS) -package $(REQ_PKG) -a -o $@ \
	$(MLMODULES:%=%.cmo) \
	-dllib -lgmp_caml \
	$(OCAMLCCOPT) \
	-cclib -lgmp_caml -cclib -lmpfr -cclib -lgmp -cclib -lcamlidl

gmp.cmxa: $(MLMODULES:%=%.cmx) $(CCLIB)
	$(OCAMLFIND) ocamlopt $(OCAMLOPTFLAGS) -package $(REQ_PKG) -a -o $@ \
	$(MLMODULES:%=%.cmx) \
	$(OCAMLCCOPT) \
	-cclib -lgmp_caml -cclib -lmpfr -cclib -lgmp -cclib -lcamlidl

gmp.p.cmxa: $(MLMODULES:%=%.p.cmx) $(CCLIB)
	$(OCAMLFIND) ocamlopt -p $(OCAMLOPTFLAGS) -package $(REQ_PKG) -a -o $@ \
	$(MLMODULES:%=%.p.cmx) \
	$(OCAMLCCOPT) \
	-cclib -lgmp_caml -cclib -lmpfr -cclib -lgmp -cclib -lcamlidl
endif
# CAML rules
libgmp_caml.a: $(CCMODULES:%=%.o)
	$(AR) rc $@ $^
	$(RANLIB) $@
libgmp_caml.p.a: $(CCMODULES:%=%.p.o)
	$(AR) rc $@ $^
	$(RANLIB) $@
dllgmp_caml.so: $(CCMODULES:%=%.o)
	$(CC) $(CFLAGS_DEBUG) $(LDFLAGS) -shared -o $@ $^ -lmpfr -lgmp -lcamlidl

.PHONY: META
META:
	/bin/rm -f META
	echo "description = \"OCaml Interface to GMP and MPFR libraries\"" >META
	echo "version = \"1.2.1\"" >>META
	echo "requires = \"$(REQ_PKG)\"" >>META
	echo "archive(byte) = \"gmp.cma\"" >>META
	echo "archive(native) = \"gmp.cmxa\"" >>META
	echo "archive(native,gprof) = \"gmp.p.cmxa\"" >>META

ifeq ($(OCAMLFIND),)
install:
	$(INSTALLd) $(MLGMPIDL_PREFIX)/include
	$(INSTALLd) $(MLGMPIDL_PREFIX)/lib
	$(INSTALL) gmp_caml.h $(MLGMPIDL_PREFIX)/include
	$(INSTALL) \
		$(IDLMODULES:%=%.idl) \
		$(MLMODULES:%=%.ml) $(MLMODULES:%=%.mli) \
		$(MLMODULES:%=%.cmi) gmp.cma \
		$(MLLIBx) $(CCLIB) \
		$(MLGMPIDL_PREFIX)/lib
uninstall:
	(cd $(MLGMPIDL_PREFIX)/include; /bin/rm -f gmp_caml.h)
	(cd $(MLGMPIDL_PREFIX)/lib; /bin/rm -f \
		$(IDLMODULES:%=%.idl) \
		$(MLMODULES:%=%.ml) $(MLMODULES:%=%.mli) \
		$(MLMODULES:%=%.cmi) gmp.cma \
		$(MLLIBx) $(CCLIB) libgmp*caml.a libgmp*caml.so)
	(cd $(MLGMPIDLPREFIX)/bin; /bin/rm -f gmprun gmptop)
else
install: $(FILES_TOINSTALL)
	$(OCAMLFIND) remove $(PKG-NAME)
	$(OCAMLFIND) install $(PKG-NAME) $^

uninstall:
	$(OCAMLFIND) remove $(PKG-NAME)
endif

clean:
	/bin/rm -fr tmp html
	/bin/rm -f gmprun gmptop
	/bin/rm -f *.aux *.bbl *.ilg *.idx *.ind *.out *.blg *.dvi *.log *.toc *.ps *.html *.pdf
	/bin/rm -f *.o *.a *.cm[ioxat] *.cmti *.cmxa *.annot *.so session.byte session.opt session.opt2 tmp/* html/*
	/bin/rm -f ocamldoc.[cefkimoptv]* ocamldoc.sty
	/bin/rm -f $(IDLMODULES:%=%.ml) $(IDLMODULES:%=%.mli) $(IDLMODULES:%=%_caml.c)

distclean: clean
	/bin/rm -f depend

PKG  = $(PKGNAME)-$(VERSION_STR)
PKGFILES = $(IDLMODULES:%=%.idl) mpfrf.ml  mpqf.ml  mpzf.ml  session.ml introduction.mli  mpfrf.mli  mpqf.mli  mpzf.mli Changes configure COPYING gmp_caml.c gmp_caml.h Makefile mlgmpidl.tex README perlscript_caml.pl perlscript_c.pl META


dist: $(IDLMODULES:%=%.idl) mpfrf.ml  mpqf.ml  mpzf.ml  session.ml introduction.mli  mpfrf.mli  mpqf.mli  mpzf.mli Changes configure COPYING gmp_caml.c gmp_caml.h Makefile mlgmpidl.tex README perlscript_caml.pl perlscript_c.pl META
	mkdir -p $(PKG)
	cp  $(PKGFILES) $(PKG)
	tar zcvf $(PKG).tgz $(PKG)
	rm -rf $(PKG)


#---------------------------------------
# TEX and HTML rules
#---------------------------------------

.PHONY: html mlgmpidl.dvi

mlgmpidl.pdf: mlgmpidl.dvi
	$(DVIPDF) mlgmpidl.dvi

mlgmpidl.dvi: introduction.mli $(MLMODULES:%=%.mli)
	$(OCAMLDOC) \
	-latextitle 1,chapter -latextitle 2,section -latextitle 3,subsection -latextitle 4,subsubsection -latextitle 5,paragraph -latextitle 6,subparagraph -noheader -notrailer -latex -o ocamldoc.tex $^
	$(LATEX) mlgmpidl
	$(MAKEINDEX) mlgmpidl
	$(LATEX) mlgmpidl
	$(LATEX) mlgmpidl

html: $(MLMODULES:%=%.mli)
	mkdir -p html
	$(OCAMLDOC) $(OCAMLINC) -html -d html -colorize-code $^

doc: byte html mlgmpidl.pdf

homepage: html mlgmpidl.pdf
	hyperlatex index
	scp -r index.html html mlgmpidl.pdf \
		salgado:/home/wwwpop-art/people/bjeannet/mlxxxidl-forge/mlgmpidl
	ssh salgado chmod -R ugoa+rx /home/wwwpop-art/people/bjeannet/mlxxxidl-forge/mlgmpidl

#--------------------------------------------------------------
# IMPLICIT RULES AND DEPENDENCIES
#--------------------------------------------------------------

.SUFFIXES: .tex .fig .c .h .o .ml .mli .cmi .cmo .cmx .idl _debug.o _prof.o _caml.c

#-----------------------------------
# IDL
#-----------------------------------

tmp:
	mkdir -p tmp

# Generate for each %.idl: %i.ml, %i.mli, %_caml.c
%.ml %.mli %_caml.c: %.idl perlscript_c.pl perlscript_caml.pl tmp
	cp $*.idl tmp/$*.idl
	$(CAMLIDL) -no-include -prepro cpp tmp/$*.idl
	$(PERL) perlscript_c.pl < tmp/$*_stubs.c >$*_caml.c
	$(PERL) perlscript_caml.pl < tmp/$*.ml >$*.ml;
	$(PERL) perlscript_caml.pl < tmp/$*.mli >$*.mli


#-----------------------------------
# C
#-----------------------------------

%.o: %.c gmp_caml.h
	$(CC) $(CFLAGS_DEBUG) $(ICFLAGS) -c -o $@ $<
%.p.o: %.c gmp_caml.h
	$(CC) $(CFLAGS_PROF) $(ICFLAGS) -c -o $@ $<

#-----------------------------------
# CAML
#-----------------------------------

%.cmi: %.mli
	$(OCAMLC) $(OCAMLFLAGS) -c $<

%.cmo: %.ml %.cmi
	$(OCAMLC) $(OCAMLFLAGS) -c $<

%.cmx: %.ml %.cmi
	$(OCAMLOPT) $(OCAMLOPTFLAGS) -c $<

%.p.cmx: %.ml %.cmi
	$(OCAMLOPT) -p $(OCAMLOPTFLAGS) $(OCAMLINC) -c -o $@ $<

#-----------------------------------
# Dependencies
#-----------------------------------

depend: $(IDLMODULES:%=%.ml) $(IDLMODULES:%=%.mli)
	$(OCAMLDEP) $(MLMODULES:%=%.mli) $(MLMODULES:%=%.ml) >Makefile.depend

Makefile.depend: $(IDLMODULES:%=%.ml) $(IDLMODULES:%=%.mli)
	$(OCAMLDEP) $(MLMODULES:%=%.mli) $(MLMODULES:%=%.ml) >Makefile.depend

-include Makefile.depend
