return function()
  require "user.custom.tmux"

  -- FileType
  vim.filetype.add {
    extension = {
      rasi = "rasi",
      conf = "config",
    },
    filename = {
      ["CmakeLists.txt"] = "cmake",
    },
  }
end
