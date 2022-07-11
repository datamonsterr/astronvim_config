require("zk").setup {
  picker = "telescope",
  lsp = {
    config = {
      cmd = { "zk", "lsp" },
      name = "zk",
      on_attach = require("configs.lsp.handlers").on_attach,
      capabilities = require("configs.lsp.handlers").capabilities,
    },
    auto_attach = { enabled = true, filetypes = { "markdown" } },
  },
}
