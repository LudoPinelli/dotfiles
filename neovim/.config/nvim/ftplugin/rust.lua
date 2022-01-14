------------- Keymaps ---------------

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("<Leader>rr", "<Cmd>Crun<CR>", opts)
map("<Leader>rc", "<Cmd>Ccheck<CR>", opts)
map("<Leader>rb", "<Cmd>Cbuild<CR>", opts)
map("<Leader>rt", "<Cmd>Ctest<CR>", opts)

-------------- cmp ------------------

local cmp = require("cmp")
cmp.setup.buffer({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "treesitter" },
		{ name = "buffer" },
		{ name = "path" },
	},
})
