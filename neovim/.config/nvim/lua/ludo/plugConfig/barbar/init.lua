vim.g.bufferline = {
	auto_hide = true,
	closable = false,
}

-- Keymaps
local Utils = require("ludo.keymaputils")
local nnoremap = Utils.nnoremap

nnoremap("<Tab>", ":BufferNext<CR>")
nnoremap("<S-Tab>", ":BufferPrevious<CR>")
nnoremap("<A-1>", ":BufferGoto 1<CR>")
nnoremap("<A-2>", ":BufferGoto 2<CR>")
nnoremap("<A-3>", ":BufferGoto 3<CR>")
nnoremap("<A-4>", ":BufferGoto 4<CR>")
nnoremap("<A-5>", ":BufferGoto 5<CR>")
nnoremap("<A-6>", ":BufferGoto 6<CR>")
nnoremap("<A-7>", ":BufferGoto 7<CR>")
nnoremap("<A-8>", ":BufferGoto 8<CR>")
nnoremap("<A-9>", ":BufferGoto 9<CR>")
nnoremap("<A-0>", ":BufferLast<CR>")
nnoremap("<Leader>c", ":BufferClose<CR>")
nnoremap("<Leader>b", ":BufferPick<CR>")
