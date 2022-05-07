local default_opts = {}
local map = vim.keymap.set
local unmap = vim.keymap.del

local unmappings = {
  n = {
    "<leader>fh",
    "<leader>u",
    "<leader>o",
    "<b",
    ">b",
  },
}

local mappings = {
  n = {
    ["<A-k>"] = { "<cmd>m .-2<CR>", { desc = "move line up" } },
    ["<A-j>"] = { "<cmd>m .+1<CR>", { desc = "move line down" } },
    ["n"] = "nzzzv",
    ["N"] = "Nzzzv",
    ["J"] = "mzJ`z",
    ["<C-w>x"] = ":WinShift swap<cr>",
    f = { ":HopChar1CurrentLine<cr>", { desc = "Hop 1 Char Current Line" } },
    F = { ":HopChar1<cr>", { desc = "Hop 1 Char Whole Buf" } },
    ["<A-c>"] = { ":VCoolor<cr>", { desc = "VCoolor" } },
  },
  v = {
    ["<A-j>"] = ":m '>+1<cr>gv=gv",
    ["<A-k>"] = ":m '<-2<cr>gv=gv",
  },
  i = {
    [","] = ",<c-g>u",
    ["."] = ".<c-g>u",
    ["!"] = "!<c-g>u",
    ["?"] = "?<c-g>u",
  },
}

-- Trying to make my mappings can use which-key styple
for mode, maps in pairs(mappings) do
  for lhs, rhs in pairs(maps) do
    if type(rhs) == "string" or type(rhs) == "function" then
      map(mode, lhs, rhs, default_opts)
    elseif type(rhs) == "table" then
      if type(rhs.name) == "string" then
        for key, value in pairs(rhs) do
          if key ~= "name" then
            map(mode, lhs .. key, value[1], { desc = value[2] })
          end
        end
      else
        map(mode, lhs, rhs[1], rhs[2])
      end
    end
  end
end

for mode, unmaps in pairs(unmappings) do
  for _, unmapkey in pairs(unmaps) do
    unmap(mode, unmapkey)
  end
end
