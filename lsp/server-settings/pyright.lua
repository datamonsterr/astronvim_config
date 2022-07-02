return {
  on_attach = function()
    vim.keymap.set("v", "<leader>f", function()
      vim.lsp.buf.range_formatting()
    end, { desc = "format range" })
    vim.api.nvim_buf_set_keymap(0, "n", "<F5>", ":!python %<cr>", { desc = "Run python code" })
  end,
}
