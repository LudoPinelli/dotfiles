local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    M = {
      name = " 󰧑  Mind",
      o = { "<Cmd>MindToggleMain<CR>", "  Mind Main" },
    },
  },
})
