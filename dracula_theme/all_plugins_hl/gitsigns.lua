local C = require "user.dracula_theme.colors"
return {
  GitSignsAdd = { fg = C.bright_green },
  GitSignsChange = { fg = C.cyan },
  GitSignsDelete = { fg = C.bright_red },
  GitSignsAddLn = { fg = C.black, bg = C.bright_green },
  GitSignsChangeLn = { fg = C.black, bg = C.cyan },
  GitSignsDeleteLn = { fg = C.black, bg = C.bright_red },
}
