/*
 LuaZip - Reading files inside zip files.

 Author: Danilo Tuler
 Copyright (c) 2003-2005 Kepler Project

 $Id: luazip.h,v 1.2 2005-06-08 20:12:33 tuler Exp $
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
