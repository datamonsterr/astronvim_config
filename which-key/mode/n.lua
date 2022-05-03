return {
  ["<leader>"] = {
    q = { ":Bdelete!<cr>", "Quit Buffer" },
    w = { ":WinShift<cr>", "WinShift" },
    c = { nil },
    a = { ":Alpha<cr>", "Alpha" },
    ["."] = { "<cmd>cd %:p:h<cr>", "Set CWD" },
    j = {
      function()
        require("nvim-window").pick()
      end,
      "Jump Win",
    },
    o = {
      name = "fOcus",
      t = {
        function()
          require("focus").focus_toggle()
        end,
        "Toggle",
      },
      e = {
        function()
          require("focus").focus_enable()
        end,
        "Enable",
      },
      n = {
        function()
          local filename = vim.fn.expand "%"
          require("focus").split_nicely(filename)
        end,
        "Nicely",
      },
      m = {
        function()
          require("focus").focus_max_or_equal()
        end,
        "Max or equal",
      },
      l = {
        function()
          local filename = vim.fn.expand "%"
          require("focus").split_command("l", filename)
        end,
        "Right",
      },
      j = {
        function()
          local filename = vim.fn.expand "%"
          require("focus").split_command("j", filename)
        end,
        "Down",
      },
      k = {
        function()
          local filename = vim.fn.expand "%"
          require("focus").split_command("k", filename)
        end,
        "Up",
      },
      h = {
        function()
          local filename = vim.fn.expand "%"
          require("focus").split_command("h", filename)
        end,
        "Left",
      },
    },
    p = {
      C = { ":PackerClean<cr>", "Clean" },
      p = {
        function()
          require("telescope").extensions.packer.packer()
        end,
        "Packer Search",
      },
    },
    f = {
      name = "Files",
      h = { nil },
      r = {
        function()
          require("telescope").extensions.repo.list {}
        end,
        "Repo",
      },
      b = {
        function()
          require("telescope").extensions.file_browser.file_browser()
        end,
        "Browse files",
      },
      l = {
        function()
          require("telescope").extensions.luasnip.luasnip {}
        end,
        "Luasnip",
      },
      z = {
        function()
          require("telescope").extensions.zoxide.list()
        end,
        "Zoxide",
      },
      p = {
        function()
          require("telescope").extensions.project.project {}
        end,
        "Project",
      },
      d = {
        name = "Dap",
        c = {
          function()
            require("telescope").extensions.dap.commands {}
          end,
          "Commands",
        },
        C = {
          function()
            require("telescope").extensions.dap.configurations {}
          end,
          "Configurations",
        },
        b = {
          function()
            require("telescope").extensions.dap.list_breakpoints {}
          end,
          "Breakpoints",
        },
        v = {
          function()
            require("telescope").extensions.dap.variables {}
          end,
          "Variables",
        },
        f = {
          function()
            require("telescope").extensions.dap.frames {}
          end,
          "Frames",
        },
      },
    },
    s = {
      b = { nil },
      r = {
        function()
          require("telescope.builtin").registers()
        end,
        "Registers",
      },
      t = {
        function()
          require("telescope.builtin").builtin()
        end,
        "Telescope",
      },
      m = {
        function()
          require("telescope.builtin").man_pages()
        end,
        "Man",
      },
    },
    d = {
      name = "Debugger",
      b = {
        function()
          require("dap").toggle_breakpoint()
        end,
        "Toggle Breakpoint",
      },
      B = {
        function()
          require("dap").clear_breakpoints()
        end,
        "Clear Breakpoints",
      },
      c = {
        function()
          require("dap").continue()
        end,
        "Continue",
      },
      i = {
        function()
          require("dap").step_into()
        end,
        "Step Into",
      },
      o = {
        function()
          require("dap").step_over()
        end,
        "Step Over",
      },
      q = {
        function()
          require("dap").close()
        end,
        "Close Session",
      },
      Q = {
        function()
          require("dap").terminate()
        end,
        "Terminate",
      },
      r = {
        function()
          require("dap").repl.toggle()
        end,
        "REPL",
      },
      s = {
        function()
          require("dapui").float_element "scopes"
        end,
        "Scopes",
      },
      t = {
        function()
          require("dapui").float_element "stacks"
        end,
        "Threads",
      },
      u = {
        function()
          require("dapui").toggle()
        end,
        "Toggle Debugger UI",
      },
      w = {
        function()
          require("dapui").float_element "watches"
        end,
        "Watches",
      },
      x = {
        function()
          require("dap.ui.widgets").hover()
        end,
        "Inspect",
      },
      v = { ":DapVirtualTextToggle<cr>", "Virtual Text" },
    },
    r = {
      name = "Run",
      n = {
        function()
          require("sniprun").run()
        end,
        "Normal",
      },
      l = {
        function()
          require("sniprun.live_mode").toggle()
        end,
        "Live",
      },
      r = {
        function()
          require("sniprun").reset()
        end,
        "reset",
      },
      i = {
        function()
          require("sniprun").info()
        end,
        "info",
      },
      c = {
        function()
          require("sniprun.display").close_all()
        end,
        "Close",
      },
    },
  },
  ["<C-s>"] = {
    function()
      require("syntax-tree-surfer").select()
    end,
    "Select",
  },
  ["<C-n>"] = {
    function()
      require("syntax-tree-surfer").select_current_node()
    end,
    "Select Node",
  },
  ["]"] = {
    f = "Next function",
    c = "Next class",
    F = "Next end function",
    C = "Next end class",
  },
  ["["] = {
    f = "Prev function",
    c = "Prev class",
    F = "Prev end function",
    C = "Prev end class",
  },
}
