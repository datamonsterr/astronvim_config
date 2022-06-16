return {
  ["ur4ltz/surround.nvim"] = {
    event = "BufRead",
    config = function()
      require("surround").setup { mappings_style = "surround" }
    end,
  },
  ["phaazon/hop.nvim"] = {
    event = "BufRead", -- I want to use it all the time
    config = function()
      require("hop").setup()
    end,
  },
  ["beauwilliams/focus.nvim"] = {
    event = "BufRead",
    config = function()
      require("focus").setup {
        excluded_filetypes = { "toggleterm", "TelescopePrompt" },
        cursorline = false,
        signcolumn = false,
      }
    end,
  },
  ["ray-x/lsp_signature.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("lsp_signature").setup {}
    end,
  },
  ["KabbAmine/vCoolor.vim"] = {
    cmd = "VCoolor",
  },
  ["mfussenegger/nvim-dap"] = {
    module = "dap",
    config = require "user.plugins.nvim-dap",
  },
  ["rcarriga/nvim-dap-ui"] = {
    after = "nvim-dap",
    config = require "user.plugins.nvim-dapui",
  },
  ["sindrets/winshift.nvim"] = {
    cmd = "WinShift",
    config = require "user.plugins.WinShift",
  },
  ["nvim-telescope/telescope-dap.nvim"] = {
    module = "telescope._extensions.dap",
  },
  ["nvim-telescope/telescope-packer.nvim"] = {
    module = "telescope._extensions.packer",
  },
  ["nvim-telescope/telescope-project.nvim"] = {
    module = "telescope._extensions.project",
  },
  ["cljoly/telescope-repo.nvim"] = {
    module = "telescope._extensions.repo",
  },
  ["datamonsterr/nvim-dracula"] = {},
  ["aserowy/tmux.nvim"] = {
    module = "tmux",
  },
  ["nvim-treesitter/playground"] = {
    cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    after = "nvim-dap",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  ["nvim-telescope/telescope-file-browser.nvim"] = {
    module = "telescope._extensions.file_browser",
  },
  ["ziontee113/syntax-tree-surfer"] = { module = "syntax-tree-surfer" },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = { after = "nvim-treesitter" },
  ["andymass/vim-matchup"] = {
    event = "BufRead",
    config = function()
      vim.g.matchup_matchparen_offscreen = {}
    end,
  },
  ["hrsh7th/cmp-nvim-lua"] = { after = "cmp_luasnip" },
  ["SmiteshP/nvim-gps"] = {
    event = "BufRead",
    config = require "user.plugins.gps",
    disable = true,
  },
  ["b0o/SchemaStore.nvim"] = { ft = "json" },
  ["jvgrootveld/telescope-zoxide"] = {
    module = "telescope._extensions.zoxide",
  },
  ["goolord/alpha-nvim"] = { disable = true },
  ["nvim-neorg/neorg"] = {
    ft = "norg",
    after = "nvim-treesitter",
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.norg.dirman"] = {
            config = {
              workspaces = {
                work = "~/notes/work",
                personal = "~/notes/personal",
              },
            },
          },
          ["core.integrations.telescope"] = {},
        },
      }
      local neorg_callbacks = require "neorg.callbacks"

      neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
        -- Map all the below keybinds only when the "norg" mode is active
        keybinds.map_event_to_mode("norg", {
          n = { -- Bind keys in normal mode
            { "<C-s>", "core.integrations.telescope.find_linkable" },
          },

          i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
          },
        }, {
          silent = true,
          noremap = true,
        })
      end)
    end,
    requires = "nvim-neorg/neorg-telescope",
  },
  ["LunarVim/darkplus.nvim"] = {},
  ["catppuccin/nvim"] = {
    as = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "frappe"
      require("catppuccin").setup {
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = "italic",
              hints = "italic",
              warnings = "italic",
              information = "italic",
            },
            underlines = {
              errors = "underline",
              hints = "underline",
              warnings = "underline",
              information = "underline",
            },
          },
          lsp_trouble = false,
          cmp = true,
          lsp_saga = false,
          gitgutter = false,
          gitsigns = true,
          telescope = true,
          nvimtree = {
            enabled = false,
            show_root = false,
            transparent_panel = false,
          },
          neotree = {
            enabled = true,
            show_root = true,
            transparent_panel = false,
          },
          which_key = false,
          indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
          },
          dashboard = false,
          neogit = false,
          vim_sneak = false,
          fern = false,
          barbar = false,
          bufferline = true,
          markdown = true,
          lightspeed = false,
          ts_rainbow = true,
          hop = true,
          notify = true,
          telekasten = false,
          symbols_outline = false,
        },
      }
    end,
  },
  ---- My Custom
  ["mg979/vim-visual-multi"] = {}, -- visual-multi cursor
  ["machakann/vim-sandwich"] = {}, -- vim-sandwitch - surronding.
  ["AndrewRadev/sideways.vim"] = {}, -- sideways - shift parameters.
  ["mhinz/vim-startify"] = {}, -- Startify.

  ["s1n7ax/nvim-window-picker"] = { -- Window Picker
    tag = "v1.*",
    config = function()
      require("window-picker").setup()
    end,
  },
  ["sudormrfbin/cheatsheet.nvim"] = {
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    ["terrortylor/nvim-comment"] = {
      config = require("nvim_comment").setup(),
    },
    ["lambdalisue/suda.vim"] = { -- Suda
      config = vim.api.nvim_set_var("suda_smart_edit", 1),
    },
    ["ethanholz/nvim-lastplace"] = { -- Remembers last place you edited.      event = "BufRead",
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
  },
}
