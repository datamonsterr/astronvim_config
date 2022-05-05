-- Redefine default function
local map = vim.keymap.set
local dc = require "nvim-dracula.colors"
local hi = function(groups, colors)
  vim.api.nvim_set_hl(0, groups, colors)
end
---@diagnostic disable-next-line: unused-local
local unmap = vim.keymap.del
return function()
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

  -- Hop
  map("n", "f", ":HopChar1CurrentLine<cr>")
  map("n", "F", ":HopChar1<cr>")
  map("n", "<C-f>", ":HopLineStart<cr>")
  map("n", "<C-f>p", ":HopPattern<cr>")
  map("n", "<C-f>w", ":HopWord<cr>")
  map("n", "<A-c>", ":VCoolor<cr>")
  unmap("n", "<C-s>")

  vim.api.nvim_del_augroup_by_name "cursor_off"
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
  hi("WinJumpColor", { fg = dc.fg, bg = dc.dim_purple })
  hi("HighlightUrl", { fg = "none", underline = true, italic = true, bg = "none" })
  hi("SniprunVirtualTextOk", { italic = true, bg = dc.bright_green, fg = dc.bg })
  hi("SniprunVirtualTextErr", { italic = true, bg = dc.bright_red, fg = dc.bg })

  -- FileType
  vim.filetype.add {
    extension = {
      rasi = "rasi",
      conf = "config",
    },
  }
end
