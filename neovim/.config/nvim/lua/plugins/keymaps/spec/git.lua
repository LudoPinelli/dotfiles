local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    g = {
      name = " 󰊢  Git",
      --
      b = {
        "<Cmd>Telescope git_branches initial_mode=normal<CR>",
        "  Branches",
      },
      B = {
        "<Cmd>Telescope git_bcommits initial_mode=normal<CR>",
        "  Commit log (current buffer)",
      },
      c = {
        "<Cmd>Telescope git_commits initial_mode=normal<CR>",
        "  Commit log",
      },
      d = {
        "<Cmd>DiffviewOpen<CR>",
        "  Open Diff view",
      },
      D = { "<Cmd>DiffviewClose<CR>", "   Close Diff view" },
      g = { "<Cmd>lua Gitui_toggle()<CR>", "  Gitui" },
      f = { "<Cmd>Telescope git_files<CR>", "Git files" },
      h = {
        "<Cmd>Gitsigns toggle_linehl<CR>",
        "Highlight line",
      },
      j = { "<Cmd>lua require('gitsigns').next_hunk()<CR>", "Next Hunk" },
      k = { "<Cmd>lua require('gitsigns').prev_hunk()<CR>", "Prev Hunk" },
      l = { "<Cmd>Gitsigns setqflist<CR>", "Changes list" },
      o = { "<Cmd>Telescope git_status<CR>", "  Open changed file" },
      p = {
        "<Cmd>lua require('gitsigns').preview_hunk()<CR>",
        "Preview Hunk",
      },
      r = { "<Cmd>lua require('gitsigns').reset_hunk()<CR>", "Reset Hunk" },
      R = {
        "<Cmd>lua require('gitsigns').reset_buffer()<CR>",
        "Reset Buffer",
      },
      s = { "<Cmd>lua require('gitsigns').stage_hunk()<CR>", "Stage Hunk" },
      S = { "<Cmd>Telescope git_status<CR>", "Git status" },
      u = {
        "<Cmd>lua require('gitsigns').undo_stage_hunk()<CR>",
        "Undo Stage Hunk",
      },
    },
  },
})
