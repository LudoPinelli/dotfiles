local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    b = {
      name = " ﬘  Buffers & Tabs",
      n = { "<Cmd>bnext<CR>", "󰮰  Next Buffer" },
      N = { "<Cmd>tabn<CR>", "󰝜  Next Tab" },
      p = { "<Cmd>bprevious<CR>", "󰮲  Previous Buffer" },
      P = { "<Cmd>tabp<CR>", "󰭋  Previous Tab" },
      d = { "<Cmd>bdelete<CR>", "  Delete Buffer" },
      D = { "<Cmd>tabclose<CR>", "󰭌  Close Tab" },
      s = {
        "<Cmd>Telescope buffers initial_mode=normal<CR>",
        "  Search Buffers",
      },
      T = { "<Cmd>$tabnew<CR>", "  New Tab" },
    },
  },
})
