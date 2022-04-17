local C = require "user.dracula_theme.colors"
return {
  TSBoolean = { fg = C.bright_cyan, bold = true },
  TSConstant = { fg = C.orange, italic = true },
  TSVariable = { fg = C.bright_cyan },
  TSFunction = { fg = C.green, bold = true },
  TSKeyword = { fg = C.pink, bold = true },
  TSKeywordFunction = { fg = C.cyan, bold = true, italic = true },
  TSConditional = { fg = C.pink, italic = true, bold = true },
  TSRepeat = { fg = C.pink, italic = true, bold = true },
  TSField = { fg = C.bright_purple },
}
