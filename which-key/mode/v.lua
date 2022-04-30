return {
  ["<leader>"] = {
    r = {
      ":'<,'>lua require('sniprun').run('v')<cr>",
      "Run",
    },
  },
  J = {
    function()
      require("syntax-tree-surfer").surf("next", "visual")
    end,
    "Next",
  },
  K = {
    function()
      require("syntax-tree-surfer").surf("prev", "visual")
    end,
    "Prev",
  },
  H = {
    function()
      require("syntax-tree-surfer").surf("parent", "visual")
    end,
    "Parent",
  },
  L = {
    function()
      require("syntax-tree-surfer").surf("child", "visual")
    end,
    "Child",
  },
  ["<A-j>"] = {
    function()
      require("syntax-tree-surfer").surf("next", "visual", true)
    end,
    "Swap Next",
  },
  ["<A-k>"] = {
    function()
      require("syntax-tree-surfer").surf("prev", "visual", true)
    end,
    "Swap Prev",
  },
}
