/*
 LuaZip - Reading files inside zip files.
 http://www.keplerproject.org/luazip/

 Author: Danilo Tuler
 Copyright (c) 2003-2005 Kepler Project

 $Id: luazip.h,v 1.3 2005-06-08 20:16:24 tuler Exp $
*/

#ifndef luazip_h
#define luazip_h

#include "lua.h"

#ifndef LUAZIP_API
#define LUAZIP_API	LUA_API
#endif

#define LUA_ZIPLIBNAME	"zip"
LUAZIP_API int luaopen_zip (lua_State *L);

#endif
