return {
  {
    "nyngwang/NeoRoot.lua",
    cmd = "NeoRoot",
  },
  {
    "simnalamburt/vim-mundo",
    cmd = "MundoToggle",
  },
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
    cmd = {
      "FocusSplitNicely",
      "FocusToggle",
      "FocusSplitRight",
      "FocusSplitLeft",
      "FocusSplitBottom",
      "FocusSplitTop",
      "FocusSplitMaximise",
      "FocusSplitEqualise",
    },
    config = function()
      require("focus").setup {
        excluded_filetypes = { "toggleterm", "Mundo", "TelescopePrompt", "MundoDiff" },
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
    "mickael-menu/zk-nvim",
    module = { "zk", "zk.commands" },
    config = require "user.plugins.zk",
  },
  {
    "vitalk/vim-simple-todo",
    keys = {
      "<Plug>(simple-todo-above)",
      "<Plug>(simple-todo-below)",
      "<Plug>(simple-todo-mark-as-done)",
      "<Plug>(simple-todo-mark-as-undone)",
      "<Plug>(simple-todo-mark-switch)",
      "<Plug>(simple-todo-new-list-item)",
      "<Plug>(simple-todo-new-list-item-start-of-line)",
    },
    setup = function()
      vim.g.simple_todo_map_keys = false
    end,
  },
  { "ellisonleao/glow.nvim" },
}
