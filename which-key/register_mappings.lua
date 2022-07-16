return {
  n = {
    ["<leader>"] = {
      name = "Plugins",
      x = { name = "Debugger" },
      d = { name = "Document" },
      h = { name = "Hop" },
      n = {
        name = "Notes",
        ["."] = { ":cd ~/Notes<cr>", "Go Notes" },
        b = {
          function()
            require "zk.commands" "ZkBacklinks"()
          end,
          "Backlink Picker",
        },
        d = {
          function()
            require "zk.commands" "ZkCd"()
          end,
          "Change Directory",
        },
        r = {
          function()
            require "zk.commands" "ZkIndex"()
          end,
          "Refresh Index",
        },
        l = {
          function()
            require "zk.commands" "ZkLinks"()
          end,
          "Link Picker",
        },
        s = {
          function()
            require("zk.commands").get "ZkNotes" { sort = { "modified" } }
          end,
          "Search",
        },
        p = {
          function()
            require("zk.commands").get "ZkNew" { dir = "personal", title = vim.fn.input "Title: " }
          end,
          "New Personal Note",
        },
        w = {
          function()
            require("zk.commands").get "ZkNew" { dir = "work", title = vim.fn.input "Title: " }
          end,
          "New Work Note",
        },
        t = {
          function()
            require("zk.commands").get "ZkTags"()
          end,
          "Tags",
        },
      },
    },
    ["]"] = {
      name = "Next objects",
      f = "Next function",
      c = "Next class",
      F = "Next end function",
      C = "Next end class",
      ["/"] = "Next comment",
    },
    ["["] = {
      name = "Prev objects",
      f = "Prev function",
      c = "Prev class",
      F = "Prev end function",
      C = "Prev end class",
      ["/"] = "Prev comment",
    },
  },
  v = {
    ["<leader>"] = {
      n = {
        name = "Notes",
        s = { ":'<,'>lua require('zk.commands').get('ZkMatch')()<cr>", "Search" },
        n = {
          ":'<,'>lua require('zk.commands').get('ZkNewFromTitleSelection')({ dir = 'personal' })<cr>",
          "New Personal Note From Title",
        },
      },
    },
  },
}
