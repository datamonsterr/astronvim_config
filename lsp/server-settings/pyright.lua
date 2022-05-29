return {
  on_attach = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<F5>", ":!python %<cr>", { desc = "" })
  end,
}
