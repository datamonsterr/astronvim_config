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
      event = "BufRead", -- I want to use it all the time
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
    },
    {
      "nvim-telescope/telescope-packer.nvim",
      module = "telescope._extensions.packer",
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
      "nvim-treesitter/playground",
      cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    },
    { "psliwka/vim-dirtytalk", run = ":DirtytalkUpdate", event = "BufRead" },
    {
      "theHamsta/nvim-dap-virtual-text",
      after = "nvim-dap",
      config = function()
        require("nvim-dap-virtual-text").setup()
      end,
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      module = "telescope._extensions.file_browser",
    },
    { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
    { "ziontee113/syntax-tree-surfer", module = "syntax-tree-surfer" },
    {
      "andymass/vim-matchup",
      event = "BufRead",
      config = function()
        vim.g.matchup_matchparen_offscreen = {}
      end,
    },
    {
      "hrsh7th/cmp-nvim-lua",
      after = "cmp_luasnip",
    },
    {
      "SmiteshP/nvim-gps",
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
    "goolord/alpha-nvim",
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
