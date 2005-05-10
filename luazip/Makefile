# $Id: Makefile,v 1.3 2005-05-10 20:21:54 tuler Exp $

T= zip

include ./config

V= 1.2.1
DIST_DIR= luazip-$V
TAR_FILE= $(DIST_DIR).tar.gz
ZIP_FILE= $(DIST_DIR).zip
LIBNAME= lib$T.$V$(LIB_EXT)

SRCS= src/lua$T.c
OBJS= src/lua$T.o $(COMPAT_DIR)/compat-5.1.o
DOCS= doc/us/index.html doc/us/license.html doc/us/manual.html doc/us/examples.html doc/us/luazip-128.png doc/us/luazip-64.png


lib: src/$(LIBNAME)

src/$(LIBNAME): $(OBJS)
	$(CC) $(CFLAGS) $(LIB_OPTION) -o src/$(LIBNAME) $(OBJS) $(LIBS)

$(COMPAT_DIR)/compat-5.1.o: $(COMPAT_DIR)/compat-5.1.c
	$(CC) -c $(CFLAGS) -o $@ $(COMPAT_DIR)/compat-5.1.c

install: src/$(LIBNAME)
	mkdir -p $(LIB_DIR)
	cp src/$(LIBNAME) $(LIB_DIR)
	cd $(LIB_DIR); ln -f -s $(LIBNAME) $(LIB_DIR)/$T$(LIB_EXT)

clean:
	rm -f $L src/$(LIBNAME) $(OBJS)

dist: dist_dir
	tar -czf $(TAR_FILE) $(DIST_DIR)
	zip -rq $(ZIP_FILE) $(DIST_DIR)/*
	rm -rf $(DIST_DIR)

dist_dir:
	mkdir -p $(DIST_DIR)/src
	mkdir -p $(DIST_DIR)/doc/us
	cp config Makefile $(DIST_DIR)
	cp $(SRCS) $(DIST_DIR)/src
	cp $(DOCS) $(DIST_DIR)/doc/us
