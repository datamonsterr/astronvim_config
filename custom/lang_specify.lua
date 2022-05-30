local map = function(lang, mode, lhs, rhs, opts)
  vim.api.nvim_create_autocmd("BufRead", {
    pattern = "*." .. lang,
    callback = function()
      vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
    end,
  })
end

map("run_python", "py", "n", "<F5>", ":!python %<cr>", { desc = "Run python code" })

map("cpp", "n", "<F4>", ":cd %:h<cr> :!g++ % -g -o %:r.out<cr>", { desc = "Compile cpp to out file to debug" })
map("cpp", "n", "<F5>", ":cd %:h<cr> :!g++ % && ./a.out<cr> :!rm a.out <cr>", { desc = "Run cpp code directly" })
