------------- Keymaps ---------------

local utils = require("ludo.keymaputils")
local nnoremap = utils.nnoremap

nnoremap("<Leader>rr", "<Cmd>:Crun<CR>")
nnoremap("<Leader>rc", "<Cmd>:Ccheck<CR>")
nnoremap("<Leader>rb", "<Cmd>:Cbuild<CR>")
nnoremap("<Leader>rt", "<Cmd>:Ctest<CR>")

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
