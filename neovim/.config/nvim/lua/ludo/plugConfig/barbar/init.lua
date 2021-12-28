vim.g.bufferline = {
	auto_hide = true,
	closable = false,
}

-- Keymaps
local Utils = require("ludo.keymaputils")
local nnoremap = Utils.nnoremap

nnoremap("<Tab>", ":BufferNext<CR>")
nnoremap("<S-Tab>", ":BufferPrevious<CR>")
nnoremap("<Leader>p", ":BufferPick<CR>")
