local theme_avail, _ = pcall(require, "nvim-dracula")
if theme_avail then
  return "default_theme" -- was dracula
else
  return "default_theme"
end
