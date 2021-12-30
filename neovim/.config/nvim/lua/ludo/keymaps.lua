local Utils = require("ludo.keymaputils")

-- local exprnnoremap = Utils.expnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
-- local tnoremap = Utils.tnoremap
-- local nmap = Utils.nmap

-- mapleader
-- nnoremap("<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.localleader = " "

-- jk to normal mode
inoremap("jk", "<Esc>")

-- Better Visual mode indent
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Move line up/down
xnoremap("<A-Down>", ":move '>+1<CR>gv-gv")
xnoremap("<A-Up>", ":move '>-2<CR>gv-gv")

nnoremap("<A-Down>", ":m .+1<CR>==")
nnoremap("<A-Up>", ":m .-2<CR>==")

inoremap("<A-Down>", "<Esc>:m .+1<CR>==gi")
inoremap("<A-Up>", "<Esc>:m .-2<CR>==gi")

-- Move between windows
nnoremap("<C-k>", "<C-w><Up>")
nnoremap("<C-j>", "<C-w><Down>")
nnoremap("<C-h>", "<C-w><Left>")
nnoremap("<C-l>", "<C-w><Right>")

-- ctrl+s to save
nnoremap("<C-s>", ":w<CR>")
inoremap("<C-s>", "<Esc>:w<CR>i")

-- return to last insert location
nnoremap("<Leader>i", "`.")

-- Toggle spellcheck
nnoremap("<Leader>z", ":set spell!<CR>")

-- Set working directory to current
nnoremap("<Leader>W", "<Cmd>:cd %:p:h<CR>:pwd<CR>")

nnoremap("K", ":lua show_documentation()<Cr>")
function show_documentation()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ "vim", "help" }, filetype) then
		vim.cmd("h " .. vim.fn.expand("<cword>"))
	elseif vim.tbl_contains({ "man" }, filetype) then
		vim.cmd("Man " .. vim.fn.expand("<cword>"))
	elseif vim.fn.expand("%:t") == "Cargo.toml" then
		require("crates").show_popup()
	else
		vim.lsp.buf.hover()
	end
end
