local theme_avail, _ = pcall(require, "nvim-dracula")
if theme_avail then
  return "nvim-dracula"
else
  return "default_theme"
end
