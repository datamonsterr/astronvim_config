local map = function(lang, mode, lhs, rhs, opts)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = lang,
    callback = function()
      vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts)
    end,
  })
end

map("python", "n", "<F5>", ":!python %<cr>", { desc = "Run python code" })

map("cpp", "n", "<F4>", ":cd %:h<cr> :!g++ % -g -o %:r.out<cr>", { desc = "Compile cpp to out file to debug" })
map("cpp", "n", "<F5>", ":cd %:h<cr> :!g++ % && ./a.out<cr> :!rm a.out <cr>", { desc = "Run cpp code directly" })

map("rust", "n", "<F4>", ":cd %:h<cr>:!cargo build<cr>", { desc = "Build rust projects with cargo" })
map("rust", "n", "<F5>", ":RustRun<cr>", { desc = "Build rust projects with cargo" })

map("javascript", "n", "<F5>", ":!node %<cr>", { desc = "Run Js code" })
