return {
  {
    "nyngwang/NeoRoot.lua",
    event = "BufWinenter",
  },
  {
    "simnalamburt/vim-mundo",
    event = "BufWinEnter",
  },
  {
    "https://gitlab.com/yorickpeterse/nvim-window.git",
    event = "BufWinEnter",
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
    event = "BufWinEnter",
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
        excluded_filetypes = { "toggleterm", "Mundo", "TelescopePrompt", "MundoDiff" },
        compatible_filetreess = { "neotree" },
      }
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  { "KabbAmine/vCoolor.vim", event = "BufRead" },
  {
    "mfussenegger/nvim-dap",
    event = "BufRead",
    config = require "user.plugins.nvim-dap",
  },
  {
    "rcarriga/nvim-dap-ui",
    after = "nvim-dap",
    config = require "user.plugins.nvim-dapui",
  },
  {
    "sindrets/winshift.nvim",
    config = require "user.plugins.WinShift",
  },
}
