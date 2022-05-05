local dc = require "nvim-dracula.colors"
local hi = function(groups, colors)
  vim.api.nvim_set_hl(0, groups, colors)
end
local custom_highlights = {
  WinJumpColor = { fg = dc.fg, bg = dc.dim_purple },
  HighlightUrl = { fg = "none", underline = true, italic = true, bg = "none" },
  SniprunVirtualTextOk = { italic = true, bg = dc.bright_green, fg = dc.bg },
  SniprunVirtualTextErr = { italic = true, bg = dc.bright_red, fg = dc.bg },
  TreesitterContext = { bg = dc.visual },
  TreesitterContextLineNumber = { bg = dc.visual, fg = dc.cyan, bold = true },
}
for group, highlights in pairs(custom_highlights) do
  hi(group, highlights)
end
