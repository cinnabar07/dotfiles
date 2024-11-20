local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({ trig = "pruy", snippetType = "autosnippet" }, {
    t("print("),
    i(1),
    t(")"),
  }),

  -- s("helper", {
  --   t({
  --     "# Helper",
  --     "tb = lambda x: x if isinstance(x, bytes) else x.encode() if isinstance(x, str) else str(x).encode()",
  --     "s = lambda msg: r.send(msg)",
  --     "sa = lambda delim, msg: r.sendafter(delim, msg)",
  --     "sla = lambda delim, msg: r.sendlineafter(delim, msg)",
  --     "sl = lambda msg: r.sendline(msg)",
  --     "rl = lambda: r.recvline()",
  --     "ru = lambda delim, drop=False: r.recvuntil(delim, drop=drop)",
  --     "rcv = lambda num: r.recv(num)",
  --     "pad8 = lambda msg: msg.ljust(8, b'\\x00')",
  --     "c = lambda i, base='A': chr(ord(base)+i)",
  --     "cb = lambda i, base='A': c(i,base).encode()",
  --     ""
  --   }),
  --   i(0)
  -- }),
  -- s("conn", {
  --   t({
  --     "def conn():",
  --     "    if args.LOCAL:",
  --     "        if args.PLT_DEBUG:",
  --     "            r = gdb.debug([exe.path], GDB_SCRIPT)",
  --     "        else:",
  --     "            r = process([exe.path])",
  --     "    else:",
  --     "        r = remote(ADDR, PORT)",
  --     "",
  --     "    return r",
  --     ""
  --   }),
  --   i(0)
  -- }),
  -- Add more snippets here
}
