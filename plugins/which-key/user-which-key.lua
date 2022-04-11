local v_mappings = require "user.plugins.which-key.register_v_leader"
local which_key = require "which-key"
local opts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}
which_key.register(v_mappings, opts)
