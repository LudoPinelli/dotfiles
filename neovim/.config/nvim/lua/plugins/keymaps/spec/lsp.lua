vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local wk = require("which-key")
    local opts = { buffer = ev.buf }
    wk.register({
      ["<Leader>"] = {
        l = {
          name = "   LSP related",
          a = { "<Cmd>Lspsaga code_action<CR>", "Code Action", opts },
          d = {
            "<Cmd>Lspsaga peek_definition<CR>",
            "󰍄  Definition",
            opts,
          },
          D = {
            "<Cmd>Lspsaga goto_definition<CR>",
            "  Go to definition",
            opts,
          },
          g = {
            "<Cmd>lua require('neogen').generate()<CR>",
            "  Generate doc",
          },
          h = {
            function()
              if vim.lsp.inlay_hint.is_enabled() then
                vim.lsp.inlay_hint.enable(0, false)
              else
                vim.lsp.inlay_hint.enable(0, true)
              end
            end,
            "Toggle Inlay Hints",
          },
          i = { "<Cmd>TodoTrouble<CR>", "  TODO/FIX etc." },
          o = { "<Cmd>Outline<CR>", "炙 Outline" },
          r = { "<Cmd>Lspsaga rename<CR>", "󰑕  Rename", opts },
          s = {
            "<Cmd>TroubleToggle lsp_references<CR>",
            -- "<Cmd>Lspsaga finder<CR>",
            "  Symbols",
            opts,
          },
          t = {
            "<Cmd>Lspsaga peek_type_definition<CR>",
            "󰍄  Type Definition",
            opts,
          },
          T = {
            "<Cmd>Lspsaga goto_type_definition<CR>",
            "  Go to Type Definition",
            opts,
          },
          w = {
            "<Cmd>TroubleToggle document_diagnostics<CR>",
            "󰄭  Document Diagnostics",
          },
          W = {
            "<Cmd>TroubleToggle workspace_diagnostics<CR>",
            "  Workspace Diagnostics",
          },
        },
      },
    })
  end,
})

-- for crates.nvim
local function show_documentation()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand("<cword>"))
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand("<cword>"))
  elseif
    vim.fn.expand("%:t") == "Cargo.toml"
    and require("crates").popup_available()
  then
    require("crates").show_popup()
  else
    vim.cmd("Lspsaga hover_doc")
  end
end

vim.keymap.set("n", "K", show_documentation, { silent = true })
