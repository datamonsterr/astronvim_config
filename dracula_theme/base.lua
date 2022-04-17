local C = require "user.dracula_theme.colors"

return {
  MatchParen = { underline = true },
  VertSplit = { fg = C.selection },
  IndentBlanklineContextChar = { fg = C.comment },
  CursorLineNr = { fg = C.bright_purple, bold = true },
}
