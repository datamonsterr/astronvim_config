local C = require "user.dracula_theme.colors"

return {
  DiagnosticVirtualTextError = { italic = true, fg = C.red },
  DiagnosticVirtualTextHint = { italic = true, fg = C.white },
  DiagnosticVirtualTextWarn = { italic = true, fg = C.orange },
  DiagnosticVirtualTextInfo = { italic = true, fg = C.green },
}
