return {
  "mrcjkb/rustaceanvim",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  version = "^3",
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function() end,
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    }
  end,
}
