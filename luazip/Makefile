# $Id: Makefile,v 1.5 2005-06-06 20:07:59 tomas Exp $

T= zip
V= 1.2.1
CONFIG= ./config

include $(CONFIG)

SRCS= src/lua$T.c
OBJS= src/lua$T.o $(COMPAT_DIR)/compat-5.1.o


lib: src/$(LIBNAME)

src/$(LIBNAME): $(OBJS)
	$(CC) $(CFLAGS) $(LIB_OPTION) -o src/$(LIBNAME) $(OBJS)

$(COMPAT_DIR)/compat-5.1.o: $(COMPAT_DIR)/compat-5.1.c
	$(CC) -c $(CFLAGS) -o $@ $(COMPAT_DIR)/compat-5.1.c

install: src/$(LIBNAME)
	mkdir -p $(LUA_LIBDIR)
	cp src/$(LIBNAME) $(LUA_LIBDIR)
	ln -f -s $(LUA_LIBDIR)/$(LIBNAME) $(LUA_LIBDIR)/$T.so

clean:
	rm -f $L src/$(LIBNAME) $(OBJS)
