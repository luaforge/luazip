package = "LuaZip"
version = "1.2.4-2"
source = {
   url = "git://github.com/rjpcomputing/luazip",
   tag = "v1_2_4"
}
description = {
   summary = "Library for reading files inside zip files",
   detailed = [[
      LuaZip is a lightweight Lua extension library used to read files
      stored inside zip files. The API is very similar to the standard
      Lua I/O library API.
   ]],
   homepage = "http://github.com/rjpcomputing/luazip",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1"
}
external_dependencies = {
   ZZIP = {
      header = "zzip.h",
   },
}
build = {
   type = "builtin",
   modules = {
      zip = {
         sources = "src/luazip.c",
         libraries = {"zzip"},
         libdirs = {"$(ZZIP_LIBDIR)"},
         incdirs = {"$(ZZIP_INCDIR)"},
      }
   },
   patches = {
[[
--- luazip/src/luazip.c	2016-07-28 19:34:08.695472558 -0300
+++ luazip/src/luazip.c	2016-07-28 19:34:13.620472470 -0300
@@ -21,6 +21,40 @@
 #define ZIPINTERNALFILEHANDLE  "lzipInternalFile"
 #define LUAZIP_MAX_EXTENSIONS 32
 
+#ifndef luaL_reg
+#define luaL_reg luaL_Reg
+#endif
+#ifndef luaL_getn
+#define luaL_getn luaL_len
+#endif
+#ifndef lua_strlen
+#define lua_strlen luaL_len
+#endif
+#ifndef luaL_optlong
+#define luaL_optlong luaL_optinteger
+#endif
+#if LUA_VERSION_NUM >= 501
+#if LUA_VERSION_NUM == 501
+/* From https://github.com/keplerproject/lua-compat-5.2/blob/v0.3/c-api/compat-5.2.c */
+void luaL_setfuncs (lua_State *L, const luaL_Reg *l, int nup) {
+  luaL_checkstack(L, nup+1, "too many upvalues");
+  for (; l->name != NULL; l++) {  /* fill the table with given functions */
+    int i;
+    lua_pushstring(L, l->name);
+    for (i = 0; i < nup; i++)  /* copy upvalues to the top */
+      lua_pushvalue(L, -(nup + 1));
+    lua_pushcclosure(L, l->func, nup);  /* closure with those upvalues */
+    lua_settable(L, -(nup + 3)); /* table must be below the upvalues, the name and the closure */
+  }
+  lua_pop(L, nup);  /* remove upvalues */
+}
+#endif
+static void luaL_openlib(lua_State *L, const char* name, const luaL_Reg* lib, int nup) {
+  lua_newtable(L); luaL_setfuncs(L, lib, nup);
+  if (name) { lua_pushvalue(L, -1); lua_setglobal(L, name); }
+}
+#endif
+
 static int pushresult (lua_State *L, int i, const char *filename) {
   if (i) {
     lua_pushboolean(L, 1);
]]
   }
}
