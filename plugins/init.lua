return function(plugins)
  local my_plugins = {
    {
      "https://gitlab.com/yorickpeterse/nvim-window.git",
      module = "nvim-window",
      config = function()
        require("nvim-window").setup {
          normal_hl = "WinJumpColor",
          hint_hl = "Bold",
          border = "none",
        }
      end,
    },
    {
      "ur4ltz/surround.nvim",
      event = "BufRead",
      config = function()
        require("surround").setup { mappings_style = "surround" }
      end,
    },
    {
      "phaazon/hop.nvim",
      branch = "v1", -- optional but strongly recommended
      cmd = {
        "HopChar1CurrentLine",
        "HopChar2",
      },
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
      end,
    },
    {
      "beauwilliams/focus.nvim",
      event = "BufRead",
      config = function()
        require("focus").setup {
          excluded_filetypes = { "toggleterm", "TelescopePrompt" },
          compatible_filetreess = { "neotree" },
        }
      end,
    },
    {
      "ray-x/lsp_signature.nvim",
      event = "InsertEnter",
      config = function()
        require("lsp_signature").setup()
      end,
    },
    {
      "KabbAmine/vCoolor.vim",
      cmd = "VCoolor",
    },
    {
      "mfussenegger/nvim-dap",
      module = "dap",
      config = require "user.plugins.nvim-dap",
    },
    {
      "rcarriga/nvim-dap-ui",
      after = "nvim-dap",
      config = require "user.plugins.nvim-dapui",
    },
    {
      "sindrets/winshift.nvim",
      cmd = "WinShift",
      config = require "user.plugins.WinShift",
    },
    {
      "nvim-telescope/telescope-dap.nvim",
      module = "telescope._extensions.dap",
      config = function()
        require("telescope").load_extension "dap"
      end,
    },
    {
      "benfowler/telescope-luasnip.nvim",
      module = "telescope._extensions.luasnip",
      config = function()
        require("telescope").load_extension "luasnip"
      end,
    },
    {
      "nvim-telescope/telescope-packer.nvim",
      module = "telescope._extensions.packer",
      config = function()
        require("telescope").load_extension "packer"
      end,
    },
    {
      "jvgrootveld/telescope-zoxide",
      module = "telescope._extensions.zoxide",
      config = function()
        require("telescope").load_extension "zoxide"
      end,
    },
    {
      "olimorris/persisted.nvim",
      module = { "persisted", "telescope._extensions.persisted" }, -- For lazy loading
      config = function()
        require("persisted").setup()
        require("telescope").load_extension "persisted" -- To load the telescope extension
        vim.o.sessionoptions = "buffers,curdir,folds,winpos,winsize"
      end,
    },
    {
      "nvim-telescope/telescope-project.nvim",
      module = "telescope._extensions.project",
      config = function()
        require("telescope").load_extension "project"
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      event = { "BufRead" },
    },
    {
      "cljoly/telescope-repo.nvim",
      module = "telescope._extensions.repo",
    },
    {
      "datamonsterr/nvim-dracula",
    },
  }
  plugins["glepnir/dashboard-nvim"] = nil
  return vim.tbl_deep_extend("force", plugins, my_plugins)
end
