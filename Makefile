# $Id: Makefile,v 1.1 2004-12-01 18:21:29 tuler Exp $

T= zip

include ./config

V= 1.2.0
DIST_DIR= luazip-$V
TAR_FILE= $(DIST_DIR).tar.gz
ZIP_FILE= $(DIST_DIR).zip
LIBNAME= lib$T.$V$(LIB_EXT)

SRCS= lua$T.c
OBJS= lua$T.o compat-5.1.o
DOCS= doc/index.html doc/license.html doc/manual.html doc/luazip-128.png doc/luazip-64.png


lib: $(LIBNAME)

$(LIBNAME): $(OBJS)
	$(CC) $(CFLAGS) $(LIB_OPTION) -o $(LIBNAME) $(OBJS) $(LIBS)

compat-5.1.o: $(COMPAT_DIR)/compat-5.1.c
	$(CC) -c $(CFLAGS) -o $@ $(COMPAT_DIR)/compat-5.1.c

install: $(LIBNAME)
	mkdir -p $(LIB_DIR)
	cp $(LIBNAME) $(LIB_DIR)
	ln -f -s $(LIB_DIR)/$(LIBNAME) $(LIB_DIR)/$T$(LIB_EXT)

clean:
	rm -f $L $(LIBNAME) $(OBJS)

dist: dist_dir
	tar -czf $(TAR_FILE) $(DIST_DIR)
	zip -rq $(ZIP_FILE) $(DIST_DIR)/*
	rm -rf $(DIST_DIR)

dist_dir:
	mkdir -p $(DIST_DIR)
	mkdir -p $(DIST_DIR)/doc
	cp config $(SRCS) lua$T.h Makefile $(DIST_DIR)
	cp $(DOCS) $(DIST_DIR)/doc
