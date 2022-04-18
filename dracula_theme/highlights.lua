local highlights = {}
local extend = function(h)
  highlights = vim.tbl_deep_extend("force", require("user.dracula_theme." .. h), highlights)
end

extend "base"
extend "diagnostics"
extend "lsp"
extend "plugins_hl"
extend "treesitter"
extend "markdown"

return highlights
