local utils = require "user.core.polish.utils"
local opts = { noremap = true, silent = true }
local map = utils.map
local kmap = utils.kmap
local nunmap = utils.nunmap
-- Set key bindings
map("n", "<A-k>", "<cmd>m .-2<CR>", opts)
map("n", "<A-j>", "<cmd>m .+1<CR>", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts)
map("i", ",", ",<c-g>u", opts)
map("i", ".", ".<c-g>u", opts)
map("i", "!", "!<c-g>u", opts)
map("i", "?", "?<c-g>u", opts)
map("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)
map("n", "<C-w>x", ":WinShift swap<cr>", opts)
kmap("n", "<C-s>", vim.diagnostic.open_float)
kmap("i", "<C-s>", vim.diagnostic.open_float)

-- Hop
map("n", "f", ":HopChar1CurrentLine<cr>", opts)
map("n", "F", ":HopChar2<cr>", opts)
-- Unmap
nunmap "<leader>fw"
nunmap "<leader>fo"
nunmap "<leader>ff"
nunmap "<leader>fh"
nunmap "<leader>fb"
nunmap "<leader>c"
nunmap "<leader>w"
