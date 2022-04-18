local C = require "user.dracula_theme.colors"
return {
  LspReferenceWrite = { bg = C.selection },
  LspReferenceRead = { bg = C.selection },
  LspReferenceText = { bg = C.selection },
  LspDiagnosticsDefaultError = { fg = C.red },
  LspDiagnosticsDefaultWarning = { fg = C.yellow },
  LspDiagnosticsDefaultInformation = { fg = C.cyan },
  LspDiagnosticsDefaultHint = { fg = C.cyan },
  LspDiagnosticsUnderlineError = { fg = C.red, undercurl = true },
  LspDiagnosticsUnderlineWarning = { fg = C.yellow, undercurl = true },
  LspDiagnosticsUnderlineInformation = { fg = C.cyan, undercurl = true },
  LspDiagnosticsUnderlineHint = { fg = C.cyan, undercurl = true },
}
