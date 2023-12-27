return {
  "ziglang/zig.vim",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    local lspconfig = require("lspconfig")
    lspconfig.zls.setup({})
  end,
}
