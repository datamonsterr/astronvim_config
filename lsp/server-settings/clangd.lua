return {
  capabilities = {
    offsetEncoding = "utf-8",
  },
  on_attach = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<F4>", ":cd %:h<cr> :!g++ % -g -o %:r.out<cr>", {})
    vim.api.nvim_buf_set_keymap(0, "n", "<F5>", ":cd %:h<cr> :!g++ % && ./a.out<cr> :!rm a.out <cr>", {})
  end,
}
