local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    c = {
      name = " □  Boxes",
      b = { "<Cmd>CBccbox<CR>", "Box Title" },
      t = { "<Cmd>CBllline<CR>", "Titled Line" },
      l = { "<Cmd>CBline<CR>", "Simple Line" },
      m = { "<Cmd>CBrrbox14<CR>", "Marked" },
      d = { "<Cmd>CBd<CR>", "Remove a box" },
    },
  },
})
