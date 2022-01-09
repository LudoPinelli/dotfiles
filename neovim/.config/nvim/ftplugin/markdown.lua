vim.opt_local.spell = true

vim.api.nvim_exec(
	[[
iabbrev >> →
iabbrev << ←
iabbrev ^^ ↑
iabbrev VV ↓
]],
	false
)

------------- Keymaps ---------------

local map = vim.keymap.set
local opts = { noremap = false, buffer = 0 }
-- Wrap selection in link
map("v", ",l", [[c[<C-r>"]()<Esc>]], opts)
-- Wrap selection in image
map("v", ",i", [[c![<C-r>"](?raw=true)<Esc>hhhhhhhhh]], opts)
-- Convert with pandoc
map("n", "go", ':silent w<bar>lua require("auto-pandoc").run_pandoc()<cr>', opts)

-------------- cmp ------------------

local cmp = require("cmp")
cmp.setup.buffer({
	sources = {
		{ name = "spell" },
		{ name = "buffer" },
		{ name = "path" },
	},
	experimental = {
		ghost_text = false,
	},
})
