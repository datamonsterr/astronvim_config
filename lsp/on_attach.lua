return function(client, bufnr)
  local diagnostics_active = true
  vim.keymap.set("n", "<leader>lt", function()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
      vim.diagnostic.show()
    else
      vim.diagnostic.hide()
    end
  end, { buffer = bufnr, desc = "Toggle diagnostics" })
  if client.name == "tsserver" or client.name == "jsonls" or client.name == "html" or client.name == "sumneko_lua" then
    client.resolved_capabilities.document_formatting = false
  end
  if client.resolved_capabilities.document_formatting then
    vim.cmd [[
            augroup LspFormatting autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]]
  end
end
