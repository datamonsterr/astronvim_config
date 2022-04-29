return {
  ["<leader>"] = {
    r = {
      ":'<,'>lua require('sniprun').run('v')<cr>",
      "Run",
    },
  },
}
