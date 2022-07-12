return function(config)
  -- https://github.com/jose-elias-alvarez/null-ls.nvim
  local null_ls = require "null-ls"
  local formatting = null_ls.builtins.formatting
  local hover = null_ls.builtins.hover
  config.sources = {
    formatting.stylua,
    formatting.autopep8,
    formatting.prettierd.with {
      env = {
        PRETTIERD_DEFAULT_CONFIG = vim.fn.expand "~/.config/.prettierrc.json",
      },
    },
    hover.dictionary,
  }
  config.on_attach = function(client)
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
