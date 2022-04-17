local highlights = {}

highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.treesitter", highlights)
highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.base", highlights)
highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.rainbow", highlights)
highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.bufferline", highlights)
highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.lsp", highlights)
highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.diagnostics", highlights)
highlights = vim.tbl_deep_extend("force", require "user.dracula_theme.telescope", highlights)

return highlights
