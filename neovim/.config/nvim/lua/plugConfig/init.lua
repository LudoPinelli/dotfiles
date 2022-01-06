require("plugConfig.alpha")
require("plugConfig.autopairs")
require("plugConfig.barbar")
require("plugConfig.cmp")
require("plugConfig.glow")
require("plugConfig.indent-blankline")
require("plugConfig.lsp")
require("plugConfig.lualine")
require("plugConfig.neoclip")
require("plugConfig.notify")
require("plugConfig.shade")
require("plugConfig.telescope")
require("plugConfig.toggleterm")
require("plugConfig.treesitter")
require("plugConfig.trouble")
require("plugConfig.which-key")
require("plugConfig.lir")

-- Where Cheat.sh give its results
vim.g.cheat_default_window_layout = "vertical_split"

-- nvim-lightbuld config
vim.cmd([[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]])
