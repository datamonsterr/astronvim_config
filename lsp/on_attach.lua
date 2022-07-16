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
    vim.api.nvim_create_augroup("format_on_save", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      desc = "Auto format before save",
      group = "format_on_save",
      pattern = "<buffer>",
      callback = function()
        vim.lsp.buf.formatting_sync { async = true }
      end,
    })
  end
end
