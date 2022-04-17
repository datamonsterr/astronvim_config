local C = require "user.dracula_theme.colors"
return {
  BufferLineIndicatorSelected = { fg = C.purple, bg = C.bg },
  BufferLineFill = { bg = C.selection },
  BufferLineBufferSelected = { fg = C.purple, bg = C.bg, bold = true },
  BufferLineBackground = { bg = C.nontext },
  BufferLineSeparator = { bg = C.nontext, fg = C.nontext },
  BufferLineSeparatorSelected = { bg = C.bg, fg = C.bg },
  BufferLineCloseButton = { bg = C.nontext },
}
