-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local navic = require("nvim-navic")


local lspconfig = require "lspconfig"

local servers = { "pyright", "lua_ls", "clangd", "rust_analyzer"}
local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function (client, bufnr)
      navic.attach(client, bufnr)
    end,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Without the loop, you would have to manually set up each LSP
--
-- lspconfig.html.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.cssls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
