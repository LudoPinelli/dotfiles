local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    b = {
      name = " ﬘  Buffers",
      n = { "<Cmd>bnext<CR>", "󰮰  Next" },
      p = { "<Cmd>bprevious<CR>", "󰮲  Previous" },
      d = { "<Cmd>bdelete<CR>", "  Delete" },
      o = { "<Cmd>BufferLinePick<CR>", "  Choose" },
    },
  },
})
