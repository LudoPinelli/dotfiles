local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Mapleader
-- nnoremap("<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.localleader = " "

-- jk to normal mode
map("i", "jk", "<Esc>", opts)

-- Move right in insert mode
map("i", "<A-l>", "<Right>", opts)

-- Quit
map("n", "<C-q>", ":q<CR>", opts)

-- Insert a line befor and after
map("n", "<Leader>o", "o<Esc>kO<Esc>ji", opts)

-- Copy to the end of the line
map("n", "Y", "y$", opts)

-- Move between windows
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Keep the cursor centered
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts)

-- Undo break points
map("i", ",", ",<C-g>u", opts)
map("i", ".", ".<C-g>u", opts)
map("i", "[", "[<C-g>u", opts)
map("i", "!", "!<C-g>u", opts)
map("i", "?", "?<C-g>u", opts)

-- Better Visual mode indent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move line up/down
map("x", "<A-Down>", ":move '>+1<CR>gv=gv", opts)
map("x", "<A-Up>", ":move '<-2<CR>gv=gv", opts)

map("n", "<A-Down>", ":m .+1<CR>==", opts)
map("n", "<A-Up>", ":m .-2<CR>==", opts)

map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", opts)

-- ctrl+s to save
map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>i", opts)

-- terminal
function _Gset_terminal_keymaps()
	local opt = { noremap = true, buffer = 0 }
	map("t", "<esc>", [[<C-\><C-n>]], opt)
	map("t", "jk", [[<C-\><C-n>]], opt)
	map("t", "<C-h>", [[<C-\><C-n><C-W>h]], opt)
	map("t", "<C-j>", [[<C-\><C-n><C-W>j]], opt)
	map("t", "<C-k>", [[<C-\><C-n><C-W>k]], opt)
	map("t", "<C-l>", [[<C-\><C-n><C-W>l]], opt)
end
