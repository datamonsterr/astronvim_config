M = {}

local unmap = function(mode, shortcut)
  vim.api.nvim_del_keymap(mode, shortcut)
end
M.set = vim.opt
M.cmd = vim.api.nvim_create_autocmd
M.group = vim.api.nvim_create_augroup
M.map = vim.api.nvim_set_keymap
M.kmap = vim.keymap.set
M.nunmap = function(shortcut)
  unmap("n", shortcut)
end

return M
