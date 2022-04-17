local C = require "user.dracula_theme.colors"
return {
  TSBoolean = { fg = C.bright_cyan, bold = true },
  TSConstant = { fg = C.orange, italic = true },
  TSVariable = { fg = C.bright_purple },
  TSFunction = { fg = C.green, bold = true },
  TSKeyword = { fg = C.pink, bold = true },
  TSInclude = { fg = C.pink, bold = true },
  TSConstructor = { fg = C.cyan, bold = true },
  TSKeywordOperator = { fg = C.pink, bold = true },
  TSKeywordFunction = { fg = C.cyan, bold = true, italic = true },
  TSConditional = { fg = C.pink, italic = true, bold = true },
  TSRepeat = { fg = C.pink, italic = true, bold = true },
  TSField = { fg = C.fg },
  TSVariableBuiltin = { fg = C.purple, italic = true },
}
