local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
  s("header_comment", {
    t("//--------------------------------------------------------------------------"),
    t({"", "// "}), i(1, "Description here"), t({"", "//--------------------------------------------------------------------------"}),
  }),
})
