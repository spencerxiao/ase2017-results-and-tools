include Makefile.config

REQUESTED = \
camllib/Makefile.config \
fixpoint/Makefile.config \
apron-dist/Makefile.config \
interproc/Makefile.config

all:
	(cd camllib; make all install)
	(cd fixpoint; make all install)
	(cd apron-dist; make all install)
	(cd interproc; make all)

install: all
	(cd interproc; make install)

rebuild: $(REQUESTED)
	(cd apron-dist; make rebuild)

clean:
	(cd camllib; make clean)
	(cd fixpoint; make clean)
	(cd apron-dist; make clean)
	(cd interproc; make clean)

distclean:
	(cd camllib; make distclean)
	(cd fixpoint; make distclean)
	(cd apron-dist; make distclean)
	(cd interproc; make distclean)
	/bin/rm -f $(REQUESTED)

uninstall:
	(cd camllib; make uninstall)
	(cd fixpoint; make uninstall)
	(cd apron-dist; make uninstall)
	(cd interproc; make uninstall)

camllib/Makefile.config: Makefile.config
	cp $^ $@
fixpoint/Makefile.config: Makefile.config
	cp $^ $@
interproc/Makefile.config: Makefile.config
	cp $^ $@
apron-dist/Makefile.config: Makefile.config
	cp $^ $@
