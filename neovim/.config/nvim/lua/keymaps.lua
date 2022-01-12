local kmap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- mapleader
-- nnoremap("<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.localleader = " "

-- jk to normal mode
kmap("i", "jk", "<Esc>", opts)

-- Move right in insert mode
kmap("i", "<A-l>", "<Right>", opts)

-- Quit
kmap("n", "<C-q>", ":q<CR>", opts)

-- Insert a line befor and after
kmap("n", "<Leader>o", "o<Esc>kO<Esc>ji", opts)

-- Copy to the end of the line
kmap("n", "Y", "y$", opts)

-- Move between windows
kmap("n", "<C-j>", "<C-w>j", opts)
kmap("n", "<C-k>", "<C-w>k", opts)
kmap("n", "<C-h>", "<C-w>h", opts)
kmap("n", "<C-l>", "<C-w>l", opts)

-- Keep the cursor centered
kmap("n", "n", "nzzzv", opts)
kmap("n", "N", "Nzzzv", opts)
kmap("n", "J", "mzJ`z", opts)

-- Undo break points
kmap("i", ",", ",<C-g>u", opts)
kmap("i", ".", ".<C-g>u", opts)
kmap("i", "[", "[<C-g>u", opts)
kmap("i", "!", "!<C-g>u", opts)
kmap("i", "?", "?<C-g>u", opts)

-- Better Visual mode indent
kmap("v", "<", "<gv", opts)
kmap("v", ">", ">gv", opts)

-- Move line up/down
kmap("x", "<A-Down>", ":move '>+1<CR>gv=gv", opts)
kmap("x", "<A-Up>", ":move '<-2<CR>gv=gv", opts)

kmap("n", "<A-Down>", ":m .+1<CR>==", opts)
kmap("n", "<A-Up>", ":m .-2<CR>==", opts)

kmap("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", opts)
kmap("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", opts)

-- ctrl+s to save
kmap("n", "<C-s>", ":w<CR>", opts)
kmap("i", "<C-s>", "<Esc>:w<CR>i", opts)

-- terminal
function _Gset_terminal_keymaps()
	local opt = { noremap = true, buffer = 0 }
	kmap("t", "<esc>", [[<C-\><C-n>]], opt)
	kmap("t", "jk", [[<C-\><C-n>]], opt)
	kmap("t", "<C-h>", [[<C-\><C-n><C-W>h]], opt)
	kmap("t", "<C-j>", [[<C-\><C-n><C-W>j]], opt)
	kmap("t", "<C-k>", [[<C-\><C-n><C-W>k]], opt)
	kmap("t", "<C-l>", [[<C-\><C-n><C-W>l]], opt)
end
