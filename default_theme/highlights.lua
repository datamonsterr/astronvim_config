return function(h)
  local C = require "default_theme.colors"
  h.TelescopeNormal = { fg = C.fg, bg = C.bg }
  h.TelescopeTitle = { fg = C.fg }
  h.TelescopeMatching = { fg = C.blue }
  h.TelescopePromptTitle = { fg = C.bg, bg = C.red }
  h.TelescopePromptNormal = { fg = C.fg, bg = C.bg }
  h.TelescopePromptPrefix = { fg = C.red, bg = C.bg }
  h.TelescopePromptCounter = { fg = C.red }
  h.TelescopeResultsTitle = { fg = C.bg, bg = C.bg }
  h.TelescopeResultsNormal = { fg = C.fg, bg = C.bg }
  h.TelescopePreviewTitle = { fg = C.bg, bg = C.green }
  h.TelescopePreviewNormal = { fg = C.fg, bg = C.bg }
  h.TelescopeBorder = { fg = C.bg, bg = C.bg }
  h.TelescopeResultsBorder = { fg = C.bg, bg = C.bg }
  h.TelescopePromptBorder = { fg = C.bg, bg = C.bg }
  h.TelescopePreviewBorder = { fg = C.bg, bg = C.bg }
  return h
end
