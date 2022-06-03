local C = require "nvim-dracula.colors"
local hi = function(groups, colors)
  vim.api.nvim_set_hl(0, groups, colors)
end
local custom_highlights = {
  WinJumpColor = { fg = C.fg, bg = C.dim_purple },
  HighlightUrl = { fg = "none", underline = true, italic = true, bg = "none" },
  SniprunVirtualTextOk = { italic = true, bg = C.bright_green, fg = C.bg },
  SniprunVirtualTextErr = { italic = true, bg = C.bright_red, fg = C.bg },
  TreesitterContext = { bg = C.visual },
  TreesitterContextLineNumber = { bg = C.visual, fg = C.cyan, bold = true },
  NeoTreeNormal = { bg = C.bg },
  NeoTreeNormalNC = { bg = C.bg },
  StatusLine = { link = "Normal" },
  BufferLineTab = { bg = C.selection, fg = C.selection },
  BufferLineTabSelected = { bg = C.selection, fg = C.selection },
}
for group, highlights in pairs(custom_highlights) do
  hi(group, highlights)
end
