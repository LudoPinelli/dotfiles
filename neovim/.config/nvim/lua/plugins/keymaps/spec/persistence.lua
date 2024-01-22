local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    p = {
      name = " □  Persistence",
      l = { "<Cmd>lua require('persistence').load()<CR>", "Load session" },
      L = {
        "<Cmd>lua require('persistence').load({ last = true })<CR>",
        "Load last session",
      },
      s = { "<Cmd>lua require('persistence').stop()<CR>", "Stop" },
    },
  },
})
