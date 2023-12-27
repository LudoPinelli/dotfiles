local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- jk to normal mode
map("i", "jk", "<Esc>", opts)

-- Remap for dealing with word wrap
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move right in insert mode
map("i", "<A-l>", "<Right>", opts)

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

-- help tags
map("n", "<A-h>", "<C-]>", opts)

-- terminal
function _G.set_terminal_keymaps()
  local bmap = vim.api.nvim_buf_set_keymap
  bmap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  bmap(0, "t", "jk", [[<C-\><C-n>]], opts)
  bmap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  bmap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  bmap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  bmap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
