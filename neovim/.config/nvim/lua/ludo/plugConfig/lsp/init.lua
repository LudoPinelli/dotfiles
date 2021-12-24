local nvim_lsp = require("lspconfig")

require("ludo.plugConfig.lsp.lsp-installer")
-- require("ludo.plugConfig.lsp.handlers").setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

nvim_lsp.rust_analyzer.setup {
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      cargo = { loadOutDirsDromCheck = true },
      procMacro = { enable = true },
    },
  },
}

require("rust-tools").setup {}
