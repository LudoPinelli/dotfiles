------------- Keymaps ---------------

local kmap = vim.keymap.set
local opts = { noremap = true, silent = true }

kmap("<Leader>rr", "<Cmd>Crun<CR>", opts)
kmap("<Leader>rc", "<Cmd>Ccheck<CR>", opts)
kmap("<Leader>rb", "<Cmd>Cbuild<CR>", opts)
kmap("<Leader>rt", "<Cmd>Ctest<CR>", opts)

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
