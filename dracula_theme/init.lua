if vim.g.colors_name == "dracula" then
  for group, spec in pairs(require "user.dracula_theme.highlights") do
    vim.api.nvim_set_hl(0, group, spec)
  end
else
  return
end
