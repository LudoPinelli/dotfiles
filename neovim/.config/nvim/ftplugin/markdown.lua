vim.opt_local.spell = true

vim.api.nvim_exec([[
iabbrev >> →
iabbrev << ←
iabbrev ^^ ↑
iabbrev VV ↓
]])

------------- Keymaps ---------------

local function remap(mode, lhs, rhs)
	vim.api.nvim_buf_set_keymap("0", mode, lhs, rhs, { noremap = true, silent = true })
end

-- Wrap selection in link
remap("v", "_", [[c[<C-r>"]()<Esc>]])
-- Convert with pandoc
remap("n", "go", ':silent w<bar>lua require("auto-pandoc").run_pandoc()<cr>')

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
