-- local C = require "user.dracula_theme.colors"
local utils = require "core.utils"
local plugins_highlight = {}
local extend = function(table)
  plugins_highlight = vim.tbl_deep_extend(
    "force",
    require("user.dracula_theme.all_plugins_hl." .. table),
    plugins_highlight
  )
end

if utils.is_available "neo-tree.nvim" then
  extend "neo-tree"
end

if utils.is_available "telescope.nvim" then
  extend "telescope"
end

if utils.is_available "bufferline.nvim" then
  extend "bufferline"
end

if utils.is_available "nvim-web-devicons" then
  extend "nvim-web-devicons"
end

if utils.is_available "nvim-notify" then
  extend "nvim-notify"
end

if utils.is_available "indent-blankline.nvim" then
  extend "indent-blankline"
end

if utils.is_available "symbols-outline.nvim" then
  extend "symbol-outline"
end

if utils.is_available "nvim-window.git" then
  extend "nvim-window"
end

if utils.is_available "gitsigns.nvim" then
  extend "gitsigns"
end
return plugins_highlight
