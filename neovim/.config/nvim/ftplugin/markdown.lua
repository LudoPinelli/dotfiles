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

-- Wrap selection in link
vim.api.nvim_buf_set_keymap(0, "v", ",l", [[c[<C-r>"]()<Esc>]], { noremap = false })
-- Wrap selection in image
vim.api.nvim_buf_set_keymap(0, "v", ",i", [[c![<C-r>"](?raw=true)<Esc>hhhhhhhhh]], { noremap = false })
-- Convert with pandoc
vim.api.nvim_buf_set_keymap(
	0,
	"n",
	"go",
	':silent w<bar>lua require("auto-pandoc").run_pandoc()<cr>',
	{ noremap = true, silent = true }
)

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
