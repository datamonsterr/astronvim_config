local pick_theme = function(theme_plugins, colorscheme)
  local theme_avail, _ = pcall(require, theme_plugins)
  if theme_avail then
    return colorscheme
  else
    return "default_theme"
  end
end

return pick_theme("dracula", "dracula")
-- return pick_theme("nightfox", "duskfox")
-- return pick_theme("catppuccin", "catppuccin")
