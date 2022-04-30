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
      event = "BufWinEnter",
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
        require("persisted").setup {
          dir = vim.fn.expand(vim.fn.stdpath "data" .. "/sessions/"), -- directory where session files are saved
          use_git_branch = false, -- create session files based on the branch of the git enabled repository
          autosave = true, -- automatically save session files when exiting Neovim
          autoload = false, -- automatically load the session for the cwd on Neovim startup
          allowed_dirs = nil, -- table of dirs that the plugin will auto-save and auto-load from
          ignored_dirs = nil, -- table of dirs that are ignored when auto-saving and auto-loading
          before_save = function()
            vim.cmd "Neotree close"
          end, -- function to run before the session is saved to disk
          after_save = function() end, -- function to run after the session is saved to disk
        }
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
    {
      "aserowy/tmux.nvim",
      module = "tmux",
    },
    {
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      module = "nvim-lsp-ts-utils",
    },
    {
      "lewis6991/spellsitter.nvim",
      event = "BufRead",
      config = function()
        require("spellsitter").setup()
      end,
    },
    {
      "nvim-treesitter/playground",
      cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
      config = function()
        require("nvim-treesitter.configs").setup {
          playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
            persist_queries = false, -- Whether the query persists across vim sessions
            keybindings = {
              toggle_query_editor = "o",
              toggle_hl_groups = "i",
              toggle_injected_languages = "t",
              toggle_anonymous_nodes = "a",
              toggle_language_display = "I",
              focus_language = "f",
              unfocus_language = "F",
              update = "R",
              goto_node = "<cr>",
              show_help = "?",
            },
          },
        }
      end,
    },
    { "psliwka/vim-dirtytalk", run = ":DirtytalkUpdate" },
    {
      "theHamsta/nvim-dap-virtual-text",
      after = "nvim-dap",
      config = function()
        require("nvim-dap-virtual-text").setup()
      end,
    },
    {
      "AckslD/nvim-neoclip.lua",
      requires = {
        { "tami5/sqlite.lua", module = "sqlite" },
        { "nvim-telescope/telescope.nvim" },
      },
      module = { "telescope._extensions.neoclip", "telescope._extensions.macroscope" },
      config = function()
        require("neoclip").setup {
          history = 200,
          enable_persistent_history = true,
          continuous_sync = false, -- Enable if I want to run it multiple sessions
          default_register = "a",
          default_register_macros = "q",
        }
      end,
    },
    { "michaelb/sniprun", run = "bash ./install.sh", module = "sniprun" },
    {
      "nvim-telescope/telescope-hop.nvim",
      module = { "telescope._extensions.hop" },
      config = function()
        require("telescope").load_extension "hop"
      end,
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      module = "telescope._extensions.file_browser",
    },
  }
  plugins["glepnir/dashboard-nvim"] = nil
  plugins["lukas-reineke/indent-blankline.nvim"] = {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require("configs.indent-line").config()
    end,
  }
  plugins["moll/vim-bbye"] = {
    "moll/vim-bbye",
    cmd = "Bdelete",
  }
  plugins["b0o/SchemaStore.nvim"] = {
    "b0o/SchemaStore.nvim",
    ft = "json",
  }

  return vim.tbl_deep_extend("force", plugins, my_plugins)
end
