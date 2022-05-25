if vim.g.colors_name == "dracula" then
  return function(_)
    local hl = require("core.status").hl
    local my_provider = {
      lsp_client_names = function(expand_null_ls)
        return function()
          local buf_client_names = {}
          for _, client in pairs(vim.lsp.buf_get_clients(0)) do
            if client.name == "null-ls" and expand_null_ls then
              vim.list_extend(buf_client_names, astronvim.null_ls_sources(vim.bo.filetype, "FORMATTING"))
              vim.list_extend(buf_client_names, astronvim.null_ls_sources(vim.bo.filetype, "DIAGNOSTICS"))
            else
              table.insert(buf_client_names, client.name)
            end
          end
          return table.concat(buf_client_names, ", ") .. " "
        end
      end,
    }
    local provider = require("core.status").provider
    local conditional = require("core.status").conditional
    local hl_mode = require("feline.providers.vi_mode").get_vim_mode
    local C = require "nvim-dracula.colors"
    local mode = function()
      if hl_mode() == "NORMAL" then
        return { fg = C.bg, bg = C.purple }
      elseif hl_mode() == "INSERT" then
        return { fg = C.bg, bg = C.cyan }
      elseif hl_mode() == "COMMAND" then
        return { fg = C.bg, bg = C.orange }
      else
        return { fg = C.bg, bg = C.pink }
      end
    end
    return {
      disable = { filetypes = { "^NvimTree$", "^neo%-tree$", "^dashboard$", "^Outline$", "^aerial$" } },
      theme = { bg = C.bg, fg = C.fg },
      components = {
        active = {
          {
            {
              provider = provider.spacer(),
              hl = mode,
              right_sep = "slant_right",
              enabled = function()
                return vim.o.filetype ~= "TelescopePrompt"
              end,
            },
            {
              provider = provider.spacer(1),
              enabled = function()
                return vim.o.filetype ~= "TelescopePrompt"
              end,
            },
            { provider = "git_branch", hl = { fg = C.purple, style = "bold" }, icon = " " },
            { provider = provider.spacer(1), enabled = conditional.git_available },
            {
              provider = function()
                local filename = vim.fn.expand "%:t:r"
                return " " .. filename .. " "
              end,
              hl = mode,
              right_sep = "slant_right",
              left_sep = "slant_left_2",
              enabled = conditional.has_filetype,
            },
            { provider = provider.spacer(1), enabled = conditional.has_filetype },
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
            {
              provider = "  Telescope ",
              hl = { fg = "bg", style = "bold", bg = C.purple },
              right_sep = "slant_right",
              enabled = function()
                return vim.bo.filetype == "TelescopePrompt"
              end,
            },
          },
          {
            {
              provider = my_provider.lsp_client_names(true),
              short_provider = my_provider.lsp_client_names(),
              hl = mode,
              right_sep = "slant_right",
              left_sep = "slant_left_2",
              icon = "   ",
            },
            { provider = provider.spacer(1), enabled = conditional.bar_width() },
            {
              provider = provider.treesitter_status,
              enabled = conditional.bar_width(),
              hl = hl.fg("GitSignsAdd", { fg = C.green }),
            },
            { provider = provider.spacer(2) },
            { provider = "position", hl = { fg = C.yellow }, enabled = conditional.has_filetype },
            { provider = provider.spacer() },
            {
              provider = provider.spacer(),
              hl = mode,
              left_sep = "slant_left_2",
            },
          },
        },
        inactive = {
          {
            {
              provider = function()
                if vim.o.filetype == "toggleterm" then
                  local display = " Term " .. vim.b.toggle_number .. " "
                  return display
                else
                  return " " .. vim.o.filetype .. " "
                end
              end,
              hl = { fg = "bg", style = "bold", bg = C.purple },
              right_sep = "slant_right",
            },
          },
          { { provider = provider.spacer(1), hl = mode, left_sep = "slant_left_2" } },
        },
      },
    }
  end
else
  return {}
end
