local Utils = require("ludo.keymaputils")

local exprnnoremap = Utils.expnnoremap
local nnoremap     = Utils.nnoremap
local vnoremap     = Utils.vnoremap
local xnoremap     = Utils.xnoremap
local inoremap     = Utils.inoremap
local tnoremap     = Utils.tnoremap
local nmap         = Utils.nmap

-- mapleader
nnoremap("<Space>", "<Nop>")
vim.g.mapleader   = " "
vim.g.localleader = " "

-- jk to normal mode
inoremap("jk", "<Esc>")

-- Better Visual mode indent
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Move line up/down
xnoremap("<C-Down>", ":move '>+1<CR>gv-gv")
xnoremap("<C-Up>", ":move '>-2<CR>gv-gv")

nnoremap("<C-Down>", ":m .+1<CR>==")
nnoremap("<C-Up>", ":m .-2<CR>==")

inoremap("<C-Down>", "<Esc>:m .+1<CR>==gi")
inoremap("<C-Up>", "<Esc>:m .-2<CR>==gi")

-- Move between windows
nnoremap("<C-k>", "<C-w><Up>")
nnoremap("<C-j>", "<C-w><Down>")
nnoremap("<C-h>", "<C-w><Left>")
nnoremap("<C-l>", "<C-w><Right>")

-- ctrl+s to save
nnoremap("<C-s>", ":w<CR>")
inoremap("<C-s>", "<Esc>:w<CR>i")

-- Telescope
nnoremap("<Leader>ff", "<Cmd>Telescope find_files<CR>")
nnoremap("<Leader>fg", "<Cmd>Telescope live_grep<CR>")
nnoremap("<Leader>fb", "<Cmd>Telescope buffers<CR>")
nnoremap("<Leader>fh", "<Cmd>Telescope help_tags<CR>")

-- Nvim-Tree
nnoremap("<Leader>e", ":NvimTreeToggle<CR>")
nnoremap("<Leader>r", ":NvimTreeRefresh<CR>")

-- Bufdelete
nnoremap("<Leader>c", ":Bdelete<CR>")

-- Barbar
-- Navigate buffers
nnoremap("<Tab>", ":BufferNext<CR>")
nnoremap("<S-Tab>", ":BufferPrevious<CR>")
-- Goto buffer
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
-- Close buffer
nnoremap("<Leader>c", ":BufferClose<CR>")
-- Buffer pick
nnoremap("<Leader>b", ":BufferPick<CR>")

-- Markdown previewer
nnoremap("<Leader>g", ":Glow<CR>")

-- Clipboard utility
nnoremap("<Leader>n", ":Telescope neoclip<CR>")
