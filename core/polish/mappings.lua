local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap
local kmap = vim.keymap.set
local unmap = vim.keymap.del
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
-- nunmap "<leader>fw"
unmap("n", "<leader>fw")
unmap("n", "<leader>fo")
unmap("n", "<leader>ff")
unmap("n", "<leader>fh")
unmap("n", "<leader>fb")
unmap("n", "<leader>c")
unmap("n", "<leader>w")
