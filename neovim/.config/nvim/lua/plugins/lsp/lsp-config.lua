return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    require("neodev").setup({
      library = { plugins = { "comment-box" }, types = true },
    })
    local lspconfig = require("lspconfig")

    vim.opt.shortmess:append("c")

    lspconfig.lua_ls.setup({
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if
          not vim.loop.fs_stat(path .. "/.luarc.json")
          and not vim.loop.fs_stat(path .. "/.luarc.jsonc")
        then
          client.config.settings =
            vim.tbl_deep_extend("force", client.config.settings, {
              Lua = {
                runtime = {
                  version = "LuaJIT",
                },
                diagnostics = {
                  globals = { "vim" },
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
              },
            })

          client.notify(
            "workspace/didChangeConfiguration",
            { settings = client.config.settings }
          )
        end
        return true
      end,
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
