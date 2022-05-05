local default_opts = {}
local map = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

local mappings = {
  n = {
    ["<A-k>"] = "<cmd>m .-2<CR>",
    ["<A-j>"] = "<cmd>m .+1<CR>",
    ["n"] = "nzzzv",
    ["N"] = "Nzzzv",
    ["J"] = "mzJ`z",
    [","] = ",<c-g>u",
    ["."] = ".<c-g>u",
    ["!"] = "!<c-g>u",
    ["?"] = "?<c-g>u",
    ["<C-w>x"] = ":WinShift swap<cr>",
    f = ":HopChar1CurrentLine<cr>",
    F = ":HopChar1<cr>",
    ["<C-f>"] = ":HopLineStart<cr>",
    ["<C-f>p"] = ":HopPattern<cr>",
    ["<C-f>w"] = ":HopWord<cr>",
    ["<A-c>"] = ":VCoolor<cr>",
  },
  v = {
    ["<A-j>"] = ":m '>+1<cr>gv=gv",
    ["<A-k>"] = ":m '<-2<cr>gv=gv",
  },
}

for mode, maps in pairs(mappings) do
  for lhs, rhs in pairs(maps) do
    if type(rhs) == "string" then
      map(mode, lhs, rhs, default_opts)
    elseif type(rhs) == "table" then
      map(mode, lhs, rhs[1], rhs[2])
    end
  end
end
