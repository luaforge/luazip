
#ifndef luazip_h
#define luazip_h

#include "lua.h"

#ifndef LUAZIP_API
#define LUAZIP_API	LUA_API
#endif

#define LUA_ZIPLIBNAME	"zip"
LUAZIP_API int luaopen_zip (lua_State *L);

#endif
