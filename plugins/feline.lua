return function(_)
  local C = require "default_theme.colors"
  local hl = require("core.status").hl
  local provider = require("core.status").provider
  local conditional = require("core.status").conditional
  local hl_mode = require("feline.providers.vi_mode").get_vim_mode
  local mode = function()
    if hl_mode() == "NORMAL" then
      return { bg = "purple" }
    elseif hl_mode() == "INSERT" then
      return { bg = "cyan" }
    elseif hl_mode() == "COMMAND" then
      return { bg = "orange" }
    else
      return { bg = "pink" }
    end
  end
  return {
    disable = { filetypes = { "^NvimTree$", "^neo%-tree$", "^dashboard$", "^Outline$", "^aerial$" } },
    theme = "dracula",
    components = {
      active = {
        {
          {
            provider = provider.spacer(),
            hl = mode(),
            right_sep = "slant_right",
          },
          { provider = provider.spacer(2) },
          { provider = "git_branch", hl = { fg = "purple", style = "bold" }, icon = " " },
          { provider = provider.spacer(3), enabled = conditional.git_available },
          {
            provider = { name = "file_type", opts = { filetype_icon = true, case = "lowercase" } },
            enabled = conditional.has_filetype,
          },
          { provider = provider.spacer(2), enabled = conditional.has_filetype },
          { provider = "git_diff_added", hl = hl.fg("GitSignsAdd", { fg = C.green }), icon = "  " },
          { provider = "git_diff_changed", hl = hl.fg("GitSignsChange", { fg = C.orange_1 }), icon = " 柳" },
          { provider = "git_diff_removed", hl = hl.fg("GitSignsDelete", { fg = C.red_1 }), icon = "  " },
          { provider = provider.spacer(2), enabled = conditional.git_changed },
          { provider = "diagnostic_errors", hl = hl.fg("DiagnosticError", { fg = C.red_1 }), icon = "  " },
          { provider = "diagnostic_warnings", hl = hl.fg("DiagnosticWarn", { fg = C.orange_1 }), icon = "  " },
          { provider = "diagnostic_info", hl = hl.fg("DiagnosticInfo", { fg = C.white_2 }), icon = "  " },
          { provider = "diagnostic_hints", hl = hl.fg("DiagnosticHint", { fg = C.yellow_1 }), icon = "  " },
        },
        {
          {
            provider = function()
              if vim.o.filetype == "TelescopePrompt" then
                return "  Telescope "
              else
                local filename = vim.fn.expand "%:t"
                return " " .. filename .. " "
              end
            end,
            hl = { fg = "bg", style = "bold", bg = "purple" },
            right_sep = "slant_right_2",
            left_sep = "slant_left_2",
            enabled = function()
              return vim.bo.filetype ~= ""
            end,
          },
        },
        {
          { provider = "lsp_client_names", enabled = conditional.bar_width(), icon = " " },
          { provider = provider.spacer(1), enabled = conditional.bar_width() },
          {
            provider = provider.treesitter_status,
            enabled = conditional.bar_width(),
            hl = hl.fg("GitSignsAdd", { fg = C.green }),
          },
          { provider = provider.spacer(2) },
          { provider = "position", hl = { fg = "yellow" } },
          { provider = provider.spacer() },
          {
            provider = provider.spacer(),
            hl = mode(),
            left_sep = "slant_left",
          },
        },
      },
      inactive = {
        {
          { provider = provider.spacer(1), hl = mode(), right_sep = "slant_right" },
        },
        {
          {
            provider = function()
              if vim.o.filetype == "toggleterm" then
                local display = " Terminal: " .. vim.b.toggle_number .. " "
                return display
              end
            end,
            hl = { fg = "bg", style = "bold", bg = "purple" },
            right_sep = "slant_right_2",
            left_sep = "slant_left_2",
          },
        },
        { { provider = provider.spacer(1), hl = mode(), left_sep = "slant_left_2" } },
      },
    },
  }
end
