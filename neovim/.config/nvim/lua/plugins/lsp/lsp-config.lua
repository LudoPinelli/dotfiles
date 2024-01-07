return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "folke/neodev.nvim", opts = {} },
    { "j-hui/fidget.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
          },
        },
      },
    })

    lspconfig.pylsp.setup({
      filetypes = { "python" },
    })

    lspconfig.marksman.setup({
      filetypes = { "markdown" },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
      end,
    })
  end,
}
