local custom = {
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

local components = require "catppuccin.core.integrations.feline"
local clrs = require("catppuccin.api.colors").get_colors() -- fetch colors with API
local sett = {
  bkg = clrs.surface0,
  diffs = clrs.mauve,
  extras = clrs.overlay1,
  curr_file = clrs.maroon,
  curr_dir = clrs.flamingo,
}
components.active[1][11]["provider"] = "line_percentage"
components.active[1][10]["provider"] = function()
  local cwd = string.gsub(vim.fn.getcwd(), "/home/datamonster", "~")
  return cwd
end
components.active[1][10]["hl"] = { fg = clrs.text, bg = clrs.surface0 }
components.active[3][4] = {
  provider = custom.lsp_client_names(true),
  short_provider = custom.lsp_client_names(),
  icon = "  ",
  hl = {
    fg = sett.bkg,
    bg = sett.curr_dir,
  },
  left_sep = {
    str = "",
    hl = {
      fg = sett.curr_dir,
      bg = sett.curr_file,
    },
  },
}
table.insert(components.inactive, {}) -- (1) left
components.inactive[1][1] = {
  provider = function()
    if vim.o.filetype == "toggleterm" then
      local display = " Term " .. vim.b.toggle_number .. " "
      return display
    else
      return " " .. vim.o.filetype .. " "
    end
  end,
  hl = { fg = clrs.maroon, bg = clrs.crust },
}

return {
  components = components,
}
