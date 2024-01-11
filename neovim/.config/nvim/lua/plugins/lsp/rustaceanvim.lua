return {
  "mrcjkb/rustaceanvim",
  dependencies = {
    -- "mfussenegger/nvim-dap",
  },
  version = "^3",
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      -- Plugin configuration
      -- tools = {},
      -- LSP configuration
      server = {
        ---@diagnostic disable-next-line: unused-local
        on_attach = function(client, bufnr)
          -- you can also put keymaps in here
          -- vim.lsp.inlay_hint.enable(bufnr, true)
        end,
        settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
          },
        },
      },
      -- DAP configuration
      dap = {},
    }
  end,
}
