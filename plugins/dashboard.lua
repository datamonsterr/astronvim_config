local g = vim.g
local fn = vim.fn

local plugins_count = fn.len(vim.fn.globpath(fn.stdpath "data" .. "/site/pack/packer/start", "*", 0, 1))

g.dashboard_disable_statusline = 1
g.dashboard_default_executive = "telescope"
g.dashboard_custom_header = {
  " ",
  " ",
  " ",
  " ",
  " ",
  " █████  ███████ ████████ ██████   ██████",
  "██   ██ ██         ██    ██   ██ ██    ██",
  "███████ ███████    ██    ██████  ██    ██",
  "██   ██      ██    ██    ██   ██ ██    ██",
  "██   ██ ███████    ██    ██   ██  ██████",
  " ",
  "    ███    ██ ██    ██ ██ ███    ███",
  "    ████   ██ ██    ██ ██ ████  ████",
  "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
  "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
  "    ██   ████   ████   ██ ██      ██",
  " ",
  " ",
  " ",
}

g.dashboard_custom_section = {
  a = { description = { "   Find File                 SPC s f" }, command = "Telescope find_files" },
  b = { description = { "   Recents                   SPC s o" }, command = "Telescope oldfiles" },
  c = { description = { "   Find Word                 SPC s w" }, command = "Telescope live_grep" },
  d = { description = { "   New File                  SPC s n" }, command = "DashboardNewFile" },
  e = { description = { "   Bookmarks                 SPC s m" }, command = "Telescope marks" },
}

g.dashboard_custom_footer = {
  " ",
  " AstroNvim loaded " .. plugins_count .. " plugins ",
}
