return {
  "simrat39/rust-tools.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    local lspconfig = require("lspconfig")
    lspconfig.rust_analyzer.setup({})
    local rt = require("rust-tools")
    rt.setup({
      executor = require("rust-tools.executors").toggleterm,
      server = {},
      tools = {
        inlay_hints = {
          max_len_align = true,
        },
      },
    })
    rt.inlay_hints.enable()
  end,
}
