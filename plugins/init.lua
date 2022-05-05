return function(plugins)
  local my_plugins = {
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
        "HopChar2CurrentLine",
        "HopChar2",
        "HopChar1",
        "HopLine",
        "HopLineStart",
        "HopWord",
        "HopWordCurrenLine",
        "HopPattern",
      },
      config = function()
        require("hop").setup()
      end,
    },
    {
      "beauwilliams/focus.nvim",
      module = "focus",
      config = function()
        require("focus").setup {
          excluded_filetypes = { "toggleterm", "TelescopePrompt" },
          cursorline = false,
          signcolumn = false,
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
      config = require "plugins.nvim-dap",
    },
    {
      "rcarriga/nvim-dap-ui",
      after = "nvim-dap",
      config = require "plugins.nvim-dapui",
    },
    {
      "sindrets/winshift.nvim",
      cmd = "WinShift",
      config = require "plugins.WinShift",
    },
    {
      "nvim-telescope/telescope-dap.nvim",
      module = "telescope._extensions.dap",
    },
    {
      "benfowler/telescope-luasnip.nvim",
      module = "telescope._extensions.luasnip",
    },
    {
      "nvim-telescope/telescope-packer.nvim",
      module = "telescope._extensions.packer",
    },
    {
      "jvgrootveld/telescope-zoxide",
      module = "telescope._extensions.zoxide",
    },
    {
      "nvim-telescope/telescope-project.nvim",
      module = "telescope._extensions.project",
    },
    {
      "cljoly/telescope-repo.nvim",
      module = "telescope._extensions.repo",
    },
    {
      "datamonsterr/nvim-dracula",
    },
    {
      "aserowy/tmux.nvim",
      module = "tmux",
    },
    {
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      module = "nvim-lsp-ts-utils",
    },
    {
      "nvim-treesitter/playground",
      cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    },
    { "psliwka/vim-dirtytalk", run = ":DirtytalkUpdate" },
    {
      "theHamsta/nvim-dap-virtual-text",
      after = "nvim-dap",
      config = function()
        require("nvim-dap-virtual-text").setup()
      end,
    },
    { "michaelb/sniprun", run = "bash ./install.sh", module = "sniprun" },
    {
      "nvim-telescope/telescope-hop.nvim",
      module = "telescope._extensions.hop",
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      module = "telescope._extensions.file_browser",
    },
    { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
    { "ziontee113/syntax-tree-surfer", module = "syntax-tree-surfer" },
    {
      "lewis6991/nvim-treesitter-context",
      after = "nvim-treesitter",
      config = function()
        require("treesitter-context").setup {
          enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
          throttle = true, -- Throttles plugin updates (may improve performance)
          max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
          patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            default = {
              "class",
              "function",
              "method",
              "for", -- These won't appear in the context
              "while",
              "if",
              "switch",
              "case",
            },
          },
        }
      end,
    },
    {
      "andymass/vim-matchup",
    },
  }
  local default_plugins = {
    {
      "b0o/SchemaStore.nvim",
      ft = "json",
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      config = function()
        require("configs.indent-line").config()
      end,
    },
    "antoinemadec/FixCursorHold.nvim",
  }

  for _, plugin in pairs(default_plugins) do
    if type(plugin) == "table" then
      plugins[plugin[1]] = plugin
    elseif type(plugin) == "string" then
      plugins[plugin] = nil
    end
  end

  return vim.tbl_deep_extend("force", plugins, my_plugins)
end
