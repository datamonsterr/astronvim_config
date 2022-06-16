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
      event = "BufRead", -- I want to use it all the time
      config = function()
        require("hop").setup()
      end,
    },
    { -- TODO:
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
    { --TODO:
      "mfussenegger/nvim-dap",
      module = "dap",
      config = require "user.plugins.nvim-dap",
    },
    {
      "rcarriga/nvim-dap-ui",
      after = "nvim-dap",
      config = require "user.plugins.nvim-dapui",
    },
    { --TODO:
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
    { --TODO:
      "aserowy/tmux.nvim",
      module = "tmux",
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
      event = "BufRead",
      config = require "user.plugins.gps",
    },
    -- TODO:
    ---- My Custom
    "mg979/vim-visual-multi", -- visual-multi cursor
    "machakann/vim-sandwich", -- vim-sandwitch - surronding.
    "AndrewRadev/sideways.vim", -- sideways - shift parameters.
    "mhinz/vim-startify", -- Startify.
    { -- Window Picker
      "s1n7ax/nvim-window-picker",
      tag = "v1.*",
      config = function()
        require("window-picker").setup()
      end,
    },
    {
      "sudormrfbin/cheatsheet.nvim",
      requires = {
        { "nvim-telescope/telescope.nvim" },
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
      },
    },
    {
      "terrortylor/nvim-comment",
      config = require("nvim_comment").setup(),
    },
    { -- TODO: Suda
      "lambdalisue/suda.vim",
      config = vim.api.nvim_set_var("suda_smart_edit", 1),
    },
    { -- Remembers last place you edited.
      "ethanholz/nvim-lastplace",
      event = "BufRead",
      config = function()
        require("nvim-lastplace").setup {
          lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
          lastplace_ignore_filetype = {
            "gitcommit",
            "gitrebase",
            "svn",
            "hgcommit",
          },
          lastplace_open_folds = true,
        }
      end,
    },
  }
  local default_plugins = {
    {
      "b0o/SchemaStore.nvim",
      ft = "json",
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
