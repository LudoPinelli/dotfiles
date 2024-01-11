local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    x = {
      name = "   Lists",
      d = {
        "<Cmd>TroubleToggle document_diagnostics<CR>",
        "Document Diagnostics",
      },
      D = {
        "<Cmd>TroubleToggle lsp_definitions<CR>",
        "Definition of the word under the cursor",
      },
      l = { "<Cmd>TroubleToggle loclist<CR>", "Loclist" },
      q = { "<Cmd>TroubleToggle quickfix<CR>", "Quickfix List" },
      r = {
        "<Cmd>TroubleToggle lsp_references<CR>",
        "Ref. of word under cursor",
      },
      t = {
        "<Cmd>TroubleToggle lsp_type_definitions<CR>",
        "Type definition of the word under the cursor",
      },
      w = {
        "<Cmd>TroubleToggle workspace_diagnostics<CR>",
        "Workspace Diagnostics",
      },
      x = { "<Cmd>TroubleToggle<CR>", "Trouble" },
    },
  },
})
