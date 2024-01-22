local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    ["?"] = { "<Cmd>Telescope oldfiles<CR>", "  Open Recent File" },
    ["E"] = { "<Cmd>lua Explorer()<CR>", "פּ  Telescope Explorer" },
    ["e"] = { "<Cmd>lua MiniFiles.open()<CR>", "פּ  Explorer" },
    ["h"] = { "<Cmd>nohlsearch<CR>", "  No Highlight" },
    ["i"] = { "`.", "  Back to last insert" },
    ["m"] = { "<Cmd>messages<CR>", "  Messages" },
    ["q"] = { "<Cmd>qa<CR>", "  Quit" },
    ["W"] = { "<Cmd>cd %:p:h<CR>:pwd<CR>", "  Set Working Directory" },
    ["n"] = {
      "<Cmd>Telescope neoclip initial_mode=normal<CR>",
      "  Clipboard",
    },
    ["z"] = { "<Cmd>set spell!<CR>", "󰓆 Toggle Spellcheck" },
  },
})
