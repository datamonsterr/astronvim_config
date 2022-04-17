local theme_avail, _ = pcall(require, "dracula")
if theme_avail then
  return "dracula"
else
  return "default_theme"
end
-- return "default_theme"
