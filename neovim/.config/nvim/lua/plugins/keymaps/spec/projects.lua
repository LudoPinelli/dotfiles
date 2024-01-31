local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    p = {
      name = "   Projects",
      a = { "<Cmd>CdProjectAdd<CR>", "Add Project" },
      o = { "<Cmd>CdProject<CR>", "Open Project" },
      s = {
        "<Cmd>CdProjectBack<CR>",
        "Switch between Last and Current Project",
      },
    },
  },
})
