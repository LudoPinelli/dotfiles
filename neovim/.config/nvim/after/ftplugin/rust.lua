------------- Keymaps ---------------

local map = vim.keymap.set
local opts = { noremap = true, silent = true, buffer = true }

map("n", "<Leader>rr", "<Cmd>Crun<CR>", opts)
map("n", "<Leader>rc", "<Cmd>Ccheck<CR>", opts)
map("n", "<Leader>rb", "<Cmd>Cbuild<CR>", opts)
map("n", "<Leader>rt", "<Cmd>Ctest<CR>", opts)

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
