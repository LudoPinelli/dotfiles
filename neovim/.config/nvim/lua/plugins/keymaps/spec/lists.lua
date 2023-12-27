local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    x = {
      name = "   Lists",
      l = { "<Cmd>TroubleToggle loclist<CR>", "Loclist" },
      q = { "<Cmd>TroubleToggle quickfix<CR>", "Quickfix List" },
      r = {
        "<Cmd>TroubleToggle lsp_references<CR>",
        "Ref. of word under cursor",
      },
      x = { "<Cmd>TroubleToggle<CR>", "Trouble" },
    },
  },
})
