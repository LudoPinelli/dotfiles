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
