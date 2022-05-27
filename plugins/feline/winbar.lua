if vim.g.colors_name == "dracula" then
  return function(_)
    local gps = require "nvim-gps"
    local C = require "nvim-dracula.colors"
    return {
      disabled = { filetypes = { "^NvimTree$", "^neo%-tree$", "^dashboard$", "^Outline$", "^aerial$" } },
      components = {
        active = {
          {
            {
              provider = function()
                local filename = vim.fn.expand "%:t"
                local filetype = vim.o.filetype
                local icon = require("nvim-web-devicons").get_icon(filename, filetype, { default = true })
                return icon .. " " .. filename .. " > " .. gps.get_location()
              end,
              enabled = function()
                return gps.is_available()
              end,
              hl = {
                bg = C.bg,
                fg = C.bright_cyan,
                style = "bolditalic",
              },
            },
          },
        },
        inactive = {
          {
            {
              provider = { name = "file_info", opts = { colored_icon = false, type = "unique-short" } },
            },
          },
        },
      },
    }
  end
end
return {}
