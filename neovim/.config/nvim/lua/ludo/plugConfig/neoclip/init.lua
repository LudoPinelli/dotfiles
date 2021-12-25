local neoclip = require("neoclip")

neoclip.setup {
  keys = {
    telescope = {
      i = {
        select  = "<CR>",
        paste   = "<C-p>",
        paste_behind = "<C-P>",
      },
    },
  },
}

require("telescope").load_extension("neoclip")
