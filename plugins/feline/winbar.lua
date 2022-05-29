if vim.g.colors_name == "dracula" then
  return function(_)
    local gps = require "nvim-gps"
    local C = require "nvim-dracula.colors"
    return {
      disable = { filetypes = { "^NvimTree$", "^neo%-tree$", "^dashboard$", "^Outline$", "^aerial$" } },
      conditional_components = {
        {
          condition = function()
            return vim.api.nvim_buf_get_option(0, "filetype") ~= "neo-tree"
          end,
          active = {
            {
              {
                provider = function()
                  -- local filename = vim.fn.expand "%:t"
                  -- local filetype = vim.o.filetype
                  -- local icon = require("nvim-web-devicons").get_icon(filename, filetype, { default = true })
                  -- return icon .. " " .. filename .. " > " .. gps.get_location()
                  return " > " .. gps.get_location()
                end,
                enabled = function()
                  return gps.is_available()
                end,
                hl = {
                  bg = C.bg,
                  fg = C.bright_purple,
                  style = "bold",
                },
              },
            },
          },
          inactive = {
            {
              {
                provider = { name = "file_info" },
                hl = { bg = C.bg, fg = C.dim_purple, style = "bold" },
              },
            },
          },
        },
      },
    }
  end
end
return {}
