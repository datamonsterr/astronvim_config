if vim.fn.exists "$TMUX" == 1 then
  local has_tmux_plugin, _ = pcall(require, "tmux")
  if has_tmux_plugin then
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
