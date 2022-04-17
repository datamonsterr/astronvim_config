local C = require "user.dracula_theme.colors"

return {
  NeoTreeDirectoryIcon = { fg = C.purple },
  NeoTreeDirectoryName = { fg = C.purple, bold = true },
  NeoTreeRootName = { fg = C.purple, bold = true },
  NeoTreeFileName = { fg = C.bright_purple },
  NeoTreeFileIcon = { fg = C.bright_purple },
  NeoTreeFileNameOpened = { fg = C.green },
  NeoTreeIndentMarker = { fg = C.purple },
  NeoTreeGitAdded = { fg = C.green },
  NeoTreeGitConflict = { fg = C.red },
  NeoTreeGitModified = { fg = C.orange },
  NeoTreeGitUntracked = { fg = C.yellow },
  NeoTreeNormal = { bg = C.bg },
  NeoTreeNormalNC = { bg = C.bg },
  NeoTreeSymbolicLinkTarget = { fg = C.cyan },
}
