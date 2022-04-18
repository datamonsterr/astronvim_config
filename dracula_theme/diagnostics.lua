local C = require "user.dracula_theme.colors"

return {
  DiagnosticVirtualTextError = { italic = true, fg = C.red },
  DiagnosticVirtualTextHint = { italic = true, fg = C.white },
  DiagnosticVirtualTextWarn = { italic = true, fg = C.orange },
  DiagnosticVirtualTextInfo = { italic = true, fg = C.green },
  DiagnosticError = { fg = C.red },
  DiagnosticWarn = { fg = C.yellow },
  DiagnosticInfo = { fg = C.cyan },
  DiagnosticHint = { fg = C.cyan },
  DiagnosticUnderlineError = { sp = C.red, undercurl = true },
  DiagnosticUnderlineWarn = { sp = C.yellow, undercurl = true },
  DiagnosticUnderlineInfo = { sp = C.cyan, undercurl = true },
  DiagnosticUnderlineHint = { sp = C.cyan, undercurl = true },
  DiagnosticSignError = { fg = C.red },
  DiagnosticSignWarn = { fg = C.yellow },
  DiagnosticSignInfo = { fg = C.cyan },
  DiagnosticSignHint = { fg = C.cyan },
  DiagnosticFloatingError = { fg = C.red },
  DiagnosticFloatingWarn = { fg = C.yellow },
  DiagnosticFloatingInfo = { fg = C.cyan },
  DiagnosticFloatingHint = { fg = C.cyan },
}
