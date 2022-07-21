return function()
  -- FileType
  vim.filetype.add {
    extension = {
      rasi = "rasi",
      conf = "config",
    },
    filename = {
      ["CmakeLists.txt"] = "cmake",
      [".clang-format"] = "yaml",
    },
  }
end
