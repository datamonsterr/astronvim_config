return function(h)
  local C = require "default_theme.colors"
  h.TSBoolean = { fg = C.orange, bold = true }
  h.TSVariable = { fg = C.yellow }
  h.TSConstant = { fg = C.yellow }
  h.TSFunction = { fg = C.blue, bold = true }
  h.TSComment = { fg = C.grey, italic = true }
  h.TSKeyword = { fg = C.purple, bold = true }
  h.TSKeywordFunction = { fg = C.blue, bold = true, italic = true }
  h.TSConditional = { fg = C.purple, italic = true, bold = true }
  h.NeoTreeNormal = { bg = C.bg }
  h.NeoTreeNormalNC = { bg = C.none }
  h.VertSplit = { bg = C.none, fg = C.grey_4 }
  h.SignColumn = { bg = C.none }
  h.WinJumpColor = { bg = C.blue, fg = C.bg, bold = true }
  h.BufferLineIndicatorSelected = { fg = C.blue }
  h.CursorLineNr = { fg = C.blue, bold = true }
  h.BufferLineTabClose = { fg = C.grey_8, bg = C.grey_8 }
  h.BufferLineFill = { bg = C.grey_8 }
  h.BufferLineBufferSelected = { fg = C.blue }
  h.rainbowcol1 = { bold = true, fg = C.yellow }
  h.rainbowcol2 = { bold = true, fg = C.purple }
  h.rainbowcol3 = { bold = true, fg = C.blue }
  h.rainbowcol4 = { bold = true, fg = C.orange }
  h.rainbowcol5 = { bold = true, fg = C.red }
  h.rainbowcol6 = { bold = true, fg = C.green }
  h.rainbowcol7 = { bold = true, fg = C.yellow }
  h.NormalFloat = { link = "Normal" }
  return h
end
