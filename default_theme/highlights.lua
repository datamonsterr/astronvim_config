return function(h)
  local C = require "default_theme.colors"
  h.TSBoolean = { fg = C.orange, bold = true }
  h.TSVariable = { fg = C.yellow }
  h.TSConstant = { fg = C.yellow, italic = true }
  h.TSFunction = { fg = C.blue, bold = true }
  h.TSComment = { fg = C.grey, italic = true }
  h.TSKeyword = { fg = C.purple, bold = true }
  h.TSKeywordFunction = { fg = C.cyan, bold = true, italic = true }
  h.TSConditional = { fg = C.purple, italic = true, bold = true }
  h.NeoTreeNormal = { bg = C.bg }
  h.NeoTreeNormalNC = { bg = C.none }
  h.VertSplit = { bg = C.none, fg = C.grey_4 }
  h.SignColumn = { bg = C.none }
  h.WinJumpColor = { bg = C.blue, fg = C.bg, bold = true }
  h.BufferLineIndicatorSelected = { fg = C.blue }
  h.CursorLineNr = { fg = C.blue, bold = true }
  -- h.BufferLineTabClose = { fg = C.grey_8, bg = C.grey_8 }
  h.BufferLineFill = { bg = C.grey_8 }
  h.BufferLineBufferSelected = { fg = C.blue }
  h.rainbowcol1 = { bold = true, fg = C.yellow_1 }
  h.rainbowcol2 = { bold = true, fg = C.purple_1 }
  h.rainbowcol3 = { bold = true, fg = C.cyan }
  h.rainbowcol4 = { bold = true, fg = C.orange_1 }
  h.rainbowcol5 = { bold = true, fg = C.red_1 }
  h.rainbowcol6 = { bold = true, fg = C.green_2 }
  h.rainbowcol7 = { bold = true, fg = C.yellow_2 }
  h.NormalFloat = { link = "Normal" }
  -- Markdown
  h.markdownTSTitle = { fg = C.blue }
  h.markdownTSLiteral = { fg = C.green }
  h.markdownTSPunctSpecial = { fg = C.red }
  h.markdownTSURI = { fg = C.purple }
  h.markdownTSStrong = { bold = true, fg = C.cyan }
  h.markdownTSEmphasis = { italic = true, fg = C.cyan }
  return h
end
