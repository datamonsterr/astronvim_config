local dc = require "nvim-dracula.colors"
local dp = require "darkplus.palette"
local cp = require("catppuccin.api.colors").get_colors() -- fetch colors with API
local cmd = vim.api.nvim_create_autocmd
local hi = function(groups, colors)
  vim.api.nvim_set_hl(0, groups, colors)
end
local custom_highlights = {
  dracula = {
    HighlightUrl = { fg = "none", underline = true, italic = true, bg = "none" },
    NeoTreeNormal = { bg = dc.bg },
    NeoTreeNormalNC = { bg = dc.bg },
    StatusLine = { link = "Normal" },
    BufferLineTab = { bg = dc.selection, fg = dc.selection },
    BufferLineTabSelected = { bg = dc.selection, fg = dc.selection },
    DapUIFloatBorder = { bg = dc.none, fg = dc.fg },
  },
  darkplus = {
    rainbowcol1 = { fg = dp.purple },
    rainbowcol2 = { fg = dp.yellow },
    rainbowcol3 = { fg = dp.magenta },
    rainbowcol4 = { fg = dp.blue },
    rainbowcol5 = { fg = dp.orange },
    rainbowcol6 = { fg = dp.light_green },
    rainbowcol7 = { fg = dp.cyan },
    rainbowcol8 = { fg = dp.yellow_orange },
    NormalFloat = { bg = dp.alt_bg },
    FloatBorder = { bg = dp.alt_bg, fg = dp.alt_bg },
    Float = { bg = dp.alt_bg },
    WhichKeyFloat = { bg = dp.alt_bg },
    TelescopeNormal = { fg = dp.fg, bg = dp.alt_bg },
    TelescopeSelection = { bg = dp.dark_gray },
    TelescopeTitle = { fg = dp.fg },
    TelescopeMatching = { fg = dp.blue },
    TelescopePromptTitle = { fg = dp.alt_bg, bg = dp.yellow },
    TelescopePromptNormal = { fg = dp.fg, bg = dp.alt_bg },
    TelescopePromptPrefix = { fg = dp.yellow, bg = dp.alt_bg },
    TelescopePromptCounter = { fg = dp.yellow },
    TelescopeResultsTitle = { fg = dp.alt_bg, bg = dp.alt_bg },
    TelescopeResultsNormal = { fg = dp.fg, bg = dp.alt_bg },
    TelescopePreviewTitle = { fg = dp.alt_bg, bg = dp.orange },
    TelescopePreviewNormal = { fg = dp.fg, bg = dp.alt_bg },
    TelescopeBorder = { fg = dp.alt_bg, bg = dp.alt_bg },
    TelescopeResultsBorder = { fg = dp.alt_bg, bg = dp.alt_bg },
    TelescopePromptBorder = { fg = dp.alt_bg, bg = dp.alt_bg },
    TelescopePreviewBorder = { fg = dp.alt_bg, bg = dp.alt_bg },
    BufferLineFill = { bg = dp.dark_gray },
    BufferLineSeparator = { bg = dp.dark_gray, fg = dp.dark_gray },
    NonText = { fg = dp.gray },
    VertSplit = { bg = dp.bg, fg = dp.dark_gray },
  },
  catppuccin = {
    rainbowcol1 = { fg = cp.pink },
    rainbowcol2 = { fg = cp.mave },
    rainbowcol3 = { fg = cp.sky },
    rainbowcol4 = { fg = cp.maroon },
    rainbowcol5 = { fg = cp.green },
    rainbowcol6 = { fg = cp.teal },
    rainbowcol7 = { fg = cp.peach },
    rainbowcol8 = { fg = cp.flamingo },
    TelescopeNormal = { fg = cp.text, bg = cp.crust },
    TelescopeSelection = { bg = cp.base },
    TelescopeTitle = { fg = cp.text },
    TelescopeMatching = { fg = cp.blue },
    TelescopePromptTitle = { fg = cp.crust, bg = cp.yellow },
    TelescopePromptNormal = { fg = cp.text, bg = cp.crust },
    TelescopePromptPrefix = { fg = cp.yellow, bg = cp.crust },
    TelescopePromptCounter = { fg = cp.yellow },
    TelescopeResultsTitle = { fg = cp.crust, bg = cp.crust },
    TelescopeResultsNormal = { fg = cp.text, bg = cp.crust },
    TelescopePreviewTitle = { fg = cp.crust, bg = cp.peach },
    TelescopePreviewNormal = { fg = cp.text, bg = cp.crust },
    TelescopeBorder = { fg = cp.crust, bg = cp.crust },
    TelescopeResultsBorder = { fg = cp.crust, bg = cp.crust },
    TelescopePromptBorder = { fg = cp.crust, bg = cp.crust },
    TelescopePreviewBorder = { fg = cp.crust, bg = cp.crust },
    NormalFloat = { bg = cp.crust },
    FloatBorder = { bg = cp.crust, fg = cp.crust },
    Float = { bg = cp.crust },
    WhichKeyFloat = { bg = cp.crust },
  },
}

local apply = function()
  for theme, settings in pairs(custom_highlights) do
    if vim.g.colors_name == theme then
      for group, highlights in pairs(settings) do
        vim.schedule(function()
          hi(group, highlights)
        end)
      end
    end
  end
end

apply()

cmd("ColorScheme", {
  callback = function()
    apply()
  end,
})
