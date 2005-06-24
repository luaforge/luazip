# $Id: Makefile,v 1.8 2005-06-24 02:00:38 tomas Exp $

T= zip
V= 1.2.1
CONFIG= ./config

include $(CONFIG)

SRCS= src/lua$T.c
OBJS= src/lua$T.o $(COMPAT_DIR)/compat-5.1.o


lib: src/$(LIBNAME)

src/$(LIBNAME): $(OBJS)
	export MACOSX_DEPLOYMENT_TARGET="10.3"; $(CC) $(CFLAGS) $(LIB_OPTION) -o src/$(LIBNAME) $(OBJS) -lzzip

$(COMPAT_DIR)/compat-5.1.o: $(COMPAT_DIR)/compat-5.1.c
	$(CC) -c $(CFLAGS) -o $@ $(COMPAT_DIR)/compat-5.1.c

install: src/$(LIBNAME)
	mkdir -p $(LUA_LIBDIR)
	cp src/$(LIBNAME) $(LUA_LIBDIR)
	cd $(LUA_LIBDIR); ln -f -h -s $(LIBNAME) $T.so

clean:
	rm -f $L src/$(LIBNAME) $(OBJS)
