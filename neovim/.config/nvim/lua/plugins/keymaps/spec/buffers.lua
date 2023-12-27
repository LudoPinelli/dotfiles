local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    b = {
      name = "   Buffers",

      d = { "<Cmd>bdelete<CR>", "󰅖  Delete buffer" },
      n = {
        "<Cmd>bnext<CR>",
        "󰮰  Next buffer",
      },
      p = { "<Cmd>bprev<CR>", "󰮳  Previous buffer" },
      o = {
        "<Cmd>BufferLinePick<CR>",
        "󱔘  Choose a buffer",
      },
    },
  },
})
