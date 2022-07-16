return function()
  if vim.fn.exists "$TMUX" == 1 then
    local has_tmux, _ = pcall(require, "tmux")
    if has_tmux then
      require("tmux").setup {
        copy_sync = {
          enable = false,
        },
        navigation = {
          cycle_navigation = true,
          enable_default_keybindings = true,
        },
        resize = {
          enable_default_keybindings = true,
        },
      }
    end
  end

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
