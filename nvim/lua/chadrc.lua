-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@class ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",

  hl_override = {
    ["@comment"] = { italic = true, fg = "#5c6370" },
    CursorLine = { bg = "#2c313a" }, -- Cursor line color
    ["@function"] = { bold = true }, -- Function names in bold
    Keyword = { italic = true },     -- Keywords in italics

  },
}

M.ui = {
  telescope = { style = "borderless" },    -- borderless / bordered

  statusline = {
    theme = "vscode_colored",    -- default/vscode/vscode_colored/minimal
    separator_style = "default",
    modules = nil,
  },


}

M.term = {
   winopts = { number = false},
   sizes = { sp = 0.3, vsp = 0.5, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
}

return M
