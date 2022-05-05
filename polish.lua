return function()
  require "custom.mappings"
  require "custom.highlights"
  require "custom.tmux"

  -- FileType
  vim.filetype.add {
    extension = {
      rasi = "rasi",
      conf = "config",
    },
  }
end
