local group = vim.api.nvim_create_augroup
local cmd = vim.api.nvim_create_autocmd
local set = vim.opt
local g = vim.g
-- Set autocommands
group("packer_conf", {})
cmd("BufWritePost", {
  desc = "Sync packer after modifying plugins.lua",
  group = "packer_conf",
  pattern = "plugins.lua",
  command = "source <afile> | PackerSync",
})
group("telescope_prompt", {})
cmd("FileType", {
  pattern = "TelescopePrompt",
  callback = function()
    for _, option in pairs { "relativenumber", "number", "cursorline" } do
      vim.opt[option] = false
    end
  end,
})
cmd("BufWinEnter", {
  desc = "For cpp",
  pattern = { "*.cpp", "*.py" },
  callback = function()
    set.softtabstop = 4
    set.tabstop = 4
    set.shiftwidth = 4
  end,
})
-- cmd("BufWinEnter", {
--   desc = "for global status",
--   callback = function()
--     set.laststatus = 3
--   end,
-- })
