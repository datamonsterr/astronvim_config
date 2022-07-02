return {
  ["ur4ltz/surround.nvim"] = {
    event = "BufRead",
    config = function()
      require("surround").setup { mappings_style = "surround" }
    end,
  },
  ["phaazon/hop.nvim"] = {
    branch = "v1", -- optional but strongly recommended
    event = "BufRead", -- I want to use it all the time
    config = function()
      require("hop").setup()
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
  ["ziontee113/syntax-tree-surfer"] = { module = "syntax-tree-surfer" },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = { after = "nvim-treesitter" },
  ["andymass/vim-matchup"] = {
    event = "BufRead",
    config = function()
      vim.g.matchup_matchparen_offscreen = {}
    end,
  },
  ["hrsh7th/cmp-nvim-lua"] = { after = "cmp_luasnip" },
  ["jvgrootveld/telescope-zoxide"] = {
    module = "telescope._extensions.zoxide",
  },
  ["goolord/alpha-nvim"] = { disable = true },
  ["catppuccin/nvim"] = {
    as = "catppuccin",
    config = function()
      vim.g.catppuccin_flavour = "mocha"
      require("catppuccin").setup {
        term_colors = true,
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
              errors = "undercurl",
              hints = "undercurl",
              warnings = "undercurl",
              information = "undercurl",
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
          which_key = true,
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
}
