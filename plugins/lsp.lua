return {
  -- add to the server on_attach function
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd [[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]]
    end
  end,

  -- Add overrides for LSP server settings, the keys are the name of the server
  ["server-settings"] = {
    clangd = {
      capabilities = {
        offsetEncoding = "utf-8",
      },
    },
  },
}
