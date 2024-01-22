local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    b = {
      name = " ﬘  Buffers & Tabs",
      n = { "<Cmd>bnext<CR>", "󰮰  Buffer Next" },
      N = { "<Cmd>tabn<CR>", "󰝜  Tab Next" },
      p = { "<Cmd>bprevious<CR>", "󰮲  Previous" },
      P = { "<Cmd>tabp<CR>", "󰭋  Tab Previous" },
      d = { "<Cmd>bdelete<CR>", "  Buffer Delete" },
      D = { "<Cmd>tabclose<CR>", "󰭌  Tab Close" },
      s = {
        "<Cmd>Telescope buffers initial_mode=normal<CR>",
        "  Search Buffers",
      },
      T = { "<Cmd>$tabnew<CR>", "  Tab New" },
    },
  },
})
