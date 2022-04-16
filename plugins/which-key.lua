return {
  -- Add bindings to the normal mode <leader> mappings
  register_n_leader = {
    ["."] = { "<cmd>NeoRoot<cr>", "Set Root" },
    ["q"] = { ":Bdelete!<cr>", "Quit Buffer" },
    ["j"] = {
      function()
        require("nvim-window").pick()
      end,
      "Jump Win",
    },
    ["w"] = { ":WinShift<cr>", "WinShift" },
    ["o"] = { nil },
    ["S"] = { ":SaveSession<cr>", "Save Session" },
    ["c"] = { nil },
    F = {
      name = "Focus",
      t = { ":FocusToggle<cr>", "Toggle" },
      a = { ":FocusSplitNicely<cr>", "Auto" },
      m = { ":FocusMaximise<cr>", "Max" },
      e = { ":FocusEqualise<cr>", "Equal" },
      l = { ":FocusSplitRight<cr>", "Rigt" },
      j = { ":FocusSplitDown<cr>", "Down" },
      k = { ":FocusSplitUp<cr>", "Up" },
      h = { ":FocusSplitLeft<cr>", "Left" },
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
    b = {
      name = "BufferLine",
      b = { ":BufferLinePick<cr>", "Pick" },
      p = { ":BufferLineTogglePin<cr>", "Pin" },
      c = { ":BufferLinePickClose<cr>", "Close" },
    },
    f = {
      name = "Files",
      h = { nil },
      s = { ":SearchSession<cr>", "Sessions" },
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
      P = {
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
    },
  },
}
