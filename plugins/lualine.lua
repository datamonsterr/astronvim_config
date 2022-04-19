return function()
  local status = require "core.status"
  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand "%:t") ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand "%:p:h"
      local gitdir = vim.fn.finddir(".git", filepath .. ";")
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }
  local colors = require "nvim-dracula.colors"
  local spacer = {
    function()
      return " "
    end,
    padding = { left = 0, right = 0 },
  }
  require("lualine").setup {
    options = {
      theme = "dracula-nvim",
      globalstatus = true,
    },
    sections = {
      lualine_a = { spacer },
      lualine_z = { spacer },
      lualine_y = {
        {
          status.lsp_name,
          icon = " ",
          color = { gui = "bold", fg = colors.bright_yellow },
          padding = { left = 1, right = 2 },
          cond = conditions.hide_in_width,
        },
        {
          status.treesitter_status,
          color = { fg = colors.cyan, gui = "bold" },
          padding = { left = 1, right = 2 },
          cond = conditions.hide_in_width,
        },
        {
          "location",
          padding = { left = 1, right = 1 },
        },
      },
    },
  }
end
