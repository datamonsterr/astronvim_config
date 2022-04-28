-- Redefine default function
local group = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd
local set = vim.opt
local g = vim.g
local map = vim.keymap.set
local opts = { silent = true }
local dracula_colors = require "nvim-dracula.colors"
local hi = function(groups, colors)
  vim.api.nvim_set_hl(0, groups, colors)
end
---@diagnostic disable-next-line: unused-local
local unmap = vim.keymap.del
return function()
  -- Options
  set.relativenumber = true
  set.spelllang = "en,programming"
  set.timeoutlen = 100
  set.updatetime = 100
  set.exrc = true
  set.numberwidth = 1
  g.vcoolor_disable_mappings = 1
  g.vcoolor_lowercase = 1
  set.list = true
  set.spell = true
  set.spellfile = "/home/dat/.config/astronvim/lua/user/spell/en.utf-8.add"
  set.listchars = {
    tab = "│→",
    extends = "⟩",
    precedes = "⟨",
    trail = "·",
    nbsp = "␣",
  }

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
  map("n", "gx", "<cmd>call jobstart(['xdg-open', expand('<cfile>')], {'detach': v:true})<cr>")
  -- Set autocommands
  group("packer_conf", {})
  cmd("BufWritePost", {
    desc = "Sync packer after modifying plugins.lua",
    group = "packer_conf",
    pattern = "plugins.lua",
    command = "source <afile> | PackerSync",
  })
  group("telescope_prompt", {})
  cmd("FileType", {
    pattern = "TelescopePrompt",
    callback = function()
      for _, option in pairs { "relativenumber", "number", "cursorline" } do
        vim.opt[option] = false
      end
    end,
  })
  cmd("BufWinEnter", {
    desc = "For cpp",
    pattern = { "*.cpp", "*.py" },
    callback = function()
      set.softtabstop = 4
      set.tabstop = 4
      set.shiftwidth = 4
    end,
  })
  if vim.fn.exists "$TMUX" == 1 then
    require("tmux").setup {
      copy_sync = {
        enable = false,
      },
      navigation = {
        cycle_navigation = true,
        enable_default_keybindings = true,
      },
      resize = {
        enable_default_keybindings = true,
      },
    }
  end
  -- Custom highlight
  hi("WinJumpColor", { fg = dracula_colors.fg, bg = dracula_colors.dim_purple })
  hi("HighlightUrl", { fg = "none", underline = true, italic = true })
end
