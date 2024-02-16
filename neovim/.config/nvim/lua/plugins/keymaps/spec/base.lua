local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    ["?"] = { "<Cmd>Telescope oldfiles<CR>", "  Open Recent File" },
    ["E"] = { "<Cmd>lua Explorer()<CR>", "פּ  Telescope Explorer" },
    ["e"] = { "<Cmd>lua MiniFiles.open()<CR>", "פּ  Explorer" },
    ["h"] = { "<Cmd>nohlsearch<CR>", "  No Highlight" },
    ["i"] = { "`.", "  Back to last insert" },
    ["q"] = { "<Cmd>qa<CR>", "  Quit" },
    ["u"] = { "<Cmd>UndotreeToggle<CR>", "  Undo Tree" },
    ["W"] = { "<Cmd>cd %:p:h<CR>:pwd<CR>", "  Set Working Directory" },
    ["z"] = { "<Cmd>set spell!<CR>", "󰓆  Toggle Spellcheck" },
  },
})
