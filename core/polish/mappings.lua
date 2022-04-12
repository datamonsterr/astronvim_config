local map = vim.keymap.set
local opts = { silent = true }
-- local unmap = vim.keymap.del
-- Set key bindings
map("n", "<A-k>", "<cmd>m .-2<CR>")
map("n", "<A-j>", "<cmd>m .+1<CR>")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")
map("v", "<A-j>", ":m '>+1<cr>gv=gv")
map("v", "<A-k>", ":m '<-2<cr>gv=gv")
map("n", "<C-w>x", ":WinShift swap<cr>")
map("n", "<C-s>", vim.diagnostic.open_float)
map("i", "<C-s>", vim.diagnostic.open_float)
map("n", "f", ":HopChar1CurrentLine<cr>", opts)
map("n", "F", ":HopChar2<cr>", opts)
map("n", "<A-c>", ":VCoolor<cr>")
