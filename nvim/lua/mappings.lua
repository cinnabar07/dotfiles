require "nvchad.mappings"
local utils = require("utils")
local term = require("nvchad.term")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "Editor Enter command mode" })
map("n", "5", "%", { desc = "Editor Bracket matching" })
map('n', '<leader>x', function() utils.delete_buffer() end, { desc = "Editor Close buffer" })

-- map('n', '<F6>', ':VimtexCompile <CR>')
map('v', '<', '<gv')
map('v', '>', '>gv')
map('v', '<C-c>', '"+y')
map('t', '<Esc>', '<C-\\><C-n>')

-- Better split
map('n', '<leader>v', '<C-w>v', { desc = "Split New vertical window" })
map('n', '<leader>h', '<C-w>s', { desc = "Split New horizontal window" })
map('n', '<leader>q', ':q!<CR>')

-- NOTE: I need a consistent lsp keymaps
map('n', '<leader>rf', ':Telescope lsp_references <CR>', { desc = "LSP references." })
map('n', '<leader>re', ':Telescope lsp_incoming_calls <CR>', { desc = "LSP incoming calls." })
map('n', '<leader>sy', ':Telescope lsp_document_symbols <CR>', { desc = "LSP document symbols" })
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', { desc = "LSP rename." })

-- tmux
map('n', '<c-h>', ':TmuxNavigateLeft <CR>')
map('n', '<c-j>', ':TmuxNavigateDown <CR>')
map('n', '<c-k>', ':TmuxNavigateUp <CR>')
map('n', '<c-l>', ':TmuxNavigateRight <CR>')
map('n', '<c-\\>', ':TmuxNavigatePrevious <CR>')


-- V8
map("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

-- NOTE: v8 code location
map("n", ".", function() utils.get_v8_url(true) end , { noremap = true, silent = true }, {desc = "V8 Copy main url"})
map("n", ",", function() utils.open_v8_url() end , { noremap = true, silent = true }, {desc = "V8 open main url"})
map('n', '>', function () utils.get_v8_url(true, true) end, {desc = "V8 copy url at current commit."} )
map('n', '<', function () utils.open_v8_url(true) end, {desc = "V8 open url at current commit."} )
map('n', '<leader>.', [[:let @+ = "b ../../" . substitute(expand('%:p'), '.*src/', 'src/', '') . ":" . line('.')<CR>]], {desc = "V8 Copy gdb command." })
-- <leader>bp :let @+ = "b ../../" . expand('%:p:h')[-(matchstr(expand('%:p'), '/src/').matchend() - 1):] . "/" . expand('%:t') . ":" . line('.')<CR>


-- NOTE: ctf helpers
local function run_python_solve(args)
  term.runner {
    pos = "float",
    cmd = "python solve.py " .. args,
    id = "floatTerm",  -- NOTE: Using default float terminal id
    clear_cmd = false,
  }
end


map("n", "<leader>ld", function()
  run_python_solve("LOCAL PLT_DEBUG")
end, { noremap = true, silent = true, desc = "CTF solve.py LOCAL PLT_DEBUG" })

map("n", "<leader>rm", function()
  run_python_solve("")
end, { noremap = true, silent = true, desc = "CTF solve.py REMOTE" })

map("n", "<leader>lc", function()
  run_python_solve("LOCAL")
end, { noremap = true, silent = true, desc = "CTF solve.py LOCAL" })


-- map('t', "<ESC>", function ()
--   utils.termcodes("<C-\\><C-N>")
-- end), {desc = "  escape terminal insert mode"})
