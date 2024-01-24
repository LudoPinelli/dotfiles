return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/neodev.nvim",
  },
  config = function()
    require("neodev").setup({
      library = { plugins = { "comment-box" }, types = true },
    })
    local lspconfig = require("lspconfig")

    vim.opt.shortmess:append("c")

    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          hint = {
            enable = true,
            setType = true,
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
          diagnostics = {
            globals = { "vim" },
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

    vim.diagnostic.config({
      virtual_text = false,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
      end,
    })

    local diag_float_grp =
      vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
      end,
      group = diag_float_grp,
    })
  end,
}
