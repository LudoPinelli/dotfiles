local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    m = {
      name = " 󰛱  Messages",
      e = { "<Cmd>Noice errors<CR>", "  Errors" },
      l = { "<Cmd>Noice last<CR>", "󰑆  Last Message" },
      m = { "<Cmd>messages<CR>", "󰵅  Messages" },
      n = { "<Cmd>Noice<CR>", "󰵅  Noice" },
      t = { "<Cmd>Noice telescope<CR>", "  Telescope" },
    },
  },
})
