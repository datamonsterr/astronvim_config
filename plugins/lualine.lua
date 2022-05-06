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

  local filename = {
    function()
      if vim.o.filetype ~= "toggleterm" then
        return vim.fn.expand "%:t"
      else
        local display = "Terminal: " .. vim.b.toggle_number
        return display
      end
    end,
    padding = { left = 2, right = 2 },
    color = { fg = colors.bright_cyan, gui = "bold" },
  }

  require("lualine").setup {
    options = {
      theme = "dracula-nvim",
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_b = {
        {
          "branch",
          icon = "",
          padding = { left = 2, right = 1 },
        },
        {
          "diff",
          symbols = { added = " ", modified = "柳", removed = " " },
          cond = conditions.hide_in_width,
          padding = { left = 2, right = 1 },
        },
      },
      lualine_c = {
        filename,
      },
      lualine_x = {
        {
          "filetype",
          cond = conditions.buffer_not_empty,
          padding = { left = 2, right = 2 },
        },
      },
      lualine_z = {
        {
          "location",
          padding = { left = 1, right = 1 },
        },
      },
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
      },
    },
  }
end
