return function(client)
  if client.name == "tsserver" or client.name == "jsonls" or client.name == "html" or client.name == "sumneko_lua" then
    client.server_capabilities.documentFormattingProvider = false
  end
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd [[
            augroup LspFormatting autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async=true})
            augroup END
            ]]
  end
end
