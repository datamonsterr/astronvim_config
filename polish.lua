return function()
  require "user.custom.mappings"
  require "user.custom.highlights"
  require "user.custom.tmux"
  vim.api.nvim_del_augroup_by_name "alpha_settings"

  -- FileType
  vim.filetype.add {
    extension = {
      rasi = "rasi",
      conf = "config",
    },
  }
end
