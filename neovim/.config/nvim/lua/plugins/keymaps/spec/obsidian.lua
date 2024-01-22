local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    o = {
      name = " 󱑿  Obsidian",
      n = { "<Cmd>ObsidianNew<CR>", "  New Note" },
      q = { "<Cmd>ObsidianQuickSwitch<CR>", "  Quick Switch" },
      f = { "<Cmd>ObsidianFollowLink vsplit<CR>", "  Follow Link" },
      b = { "<Cmd>ObsidianBacklink<CR>", "󰿨  Backlinks" },
      s = { "<Cmd>ObsidianSearch<CR>", "  Search" },
      L = { "<Cmd>ObsidianLink<CR>", "  Link" },
      l = { "<Cmd>ObsidianLinkNew<CR>", "󰲔  New Link" },
      w = { "<Cmd>ObsidianWorkspace<CR>", "  Workspaces" },
      r = { "<Cmd>ObsidianRename<CR>", "󰑕  Rename" },
      i = { "<Cmd>ObsidianPasteImg<CR>", "  Paste Image" },
    },
  },
})
