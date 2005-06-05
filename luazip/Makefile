# $Id: Makefile,v 1.4 2005-06-05 17:21:05 tomas Exp $

T= zip
V= 1.2.1

include ./config

SRCS= src/lua$T.c
OBJS= src/lua$T.o $(COMPAT_DIR)/compat-5.1.o


lib: src/$(LIBNAME)

src/$(LIBNAME): $(OBJS)
	$(CC) $(CFLAGS) $(LIB_OPTION) -o src/$(LIBNAME) $(OBJS)

$(COMPAT_DIR)/compat-5.1.o: $(COMPAT_DIR)/compat-5.1.c
	$(CC) -c $(CFLAGS) -o $@ $(COMPAT_DIR)/compat-5.1.c

install: src/$(LIBNAME)
	mkdir -p $(LIB_DIR)
	cp src/$(LIBNAME) $(LUA_LIBDIR)
	ln -f -s $(LUA_LIBDIR)/$(LIBNAME) $(LUA_LIBDIR/$T.so

clean:
	rm -f $L src/$(LIBNAME) $(OBJS)
