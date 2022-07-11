local cp = require("catppuccin.api.colors").get_colors() -- fetch colors with API
return {
  theme = { bg = "#000000", fg = cp.text },
  components = {
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
          hl = { bg = "#000000" },
        },
      },
    },
  },
}
