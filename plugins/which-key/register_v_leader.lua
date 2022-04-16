return {
  ["/"] = { "Comments" },
  z = {
    name = "Zk",
    s = { ":'<,'>ZkMatch<cr>", "Search" },
    n = {
      ":'<,'>ZkNewFromTitleSelection { dir = 'personal' }<cr>",
      "New Personal Note From Title",
    },
    N = {
      ":'<,'>ZkNewFromTitleSelection { dir = 'work' }<cr>",
      "New Work Note From Title",
    },
    W = {
      ":'<,'>ZkNewFromContentSelection { dir = 'work', title = vim.fn.input('Title: ') }<cr>",
      "New Work Note From Content",
    },
    C = {
      ":'<,'>ZkNewFromContentSelection { dir = 'personal', title = vim.fn.input('Title: ') }<cr>",
      "New Personal Note From Content",
    },
  },
  ["<tab>"] = { "<Plug>(simple-todo-mark-switch)", "Toggle Todo" },
}
