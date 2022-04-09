local utils = require "user.core.polish.utils"
local group = utils.group
local cmd = utils.cmd
local set = utils.set
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
