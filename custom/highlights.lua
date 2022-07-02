local cp = require("catppuccin.api.colors").get_colors() -- fetch colors with API
local cmd = vim.api.nvim_create_autocmd
local hi = function(groups, colors)
  vim.api.nvim_set_hl(0, groups, colors)
end
local custom_highlights = {
  catppuccin = {
    TSFuncBuiltin = { fg = cp.sapphire, bold = true },
    rainbowcol1 = { fg = cp.pink },
    rainbowcol2 = { fg = cp.mauve },
    rainbowcol3 = { fg = cp.rosewater },
    rainbowcol4 = { fg = cp.maroon },
    rainbowcol5 = { fg = cp.red },
    rainbowcol6 = { fg = cp.blue },
    rainbowcol7 = { fg = cp.peach },
    rainbowcol8 = { fg = cp.flamingo },
    TelescopeNormal = { fg = cp.text, bg = cp.crust },
    TelescopeSelection = { bg = cp.base },
    TelescopeTitle = { fg = cp.text },
    TelescopeMatching = { fg = cp.peach },
    TelescopePromptTitle = { fg = cp.crust, bg = cp.rosewater },
    TelescopePromptNormal = { fg = cp.text, bg = cp.crust },
    TelescopePromptPrefix = { fg = cp.yellow, bg = cp.crust },
    TelescopePromptCounter = { fg = cp.yellow },
    TelescopeResultsTitle = { fg = cp.crust, bg = cp.crust },
    TelescopeResultsNormal = { fg = cp.text, bg = cp.crust },
    TelescopePreviewTitle = { fg = cp.crust, bg = cp.maroon },
    TelescopePreviewNormal = { fg = cp.text, bg = cp.crust },
    TelescopeBorder = { fg = cp.crust, bg = cp.crust },
    TelescopeResultsBorder = { fg = cp.crust, bg = cp.crust },
    TelescopePromptBorder = { fg = cp.crust, bg = cp.crust },
    TelescopePreviewBorder = { fg = cp.crust, bg = cp.crust },
    BufferLineFill = { bg = cp.crust },
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
