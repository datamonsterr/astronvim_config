return function(config)
  -- Formatting and linting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim
  local null_ls = require "null-ls"
  -- Check supported formatters
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- Check supported linters
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics
  -- local code_actions = null_ls.builtins.code_actions
  local hover = null_ls.builtins.hover
  config.sources = {
    -- Set a formatter
    formatting.stylua,
    formatting.autopep8,
    formatting.prettierd.with {
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand "~/.config/.prettierrc.json",
      },
    },
    -- Set a linter
    -- Eslint
    -- code_actions.eslint_d.with {
    --   prefer_local = "node_modules/.bin",
    -- },
    hover.dictionary,
  }
  -- NOTE: You can remove this on attach function to disable format on save
  config.on_attach = function(client)
    -- NOTE: You can remove this on attach function to disable format on save
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Auto format before save",
        pattern = "<buffer>",
        callback = function()
          vim.lsp.buf.formatting_sync { async = true }
        end,
      })
    end
  end
  return config
end
