local ls = require("luasnip")

local types = require("luasnip.util.types")

ls.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "●", "GruvboxOrange" } },
      },
    },
  },
})

-- Load snippets
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets"})

-- Setup keybindings for expand and jumping
vim.keymap.set({ "i", "s" }, "<Tab>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- Load custom snippets
ls.add_snippets("python", {
  ls.parser.parse_snippet("pr", "print($1)"),
})


-- Return the module
return ls
