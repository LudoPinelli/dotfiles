vim.opt_local.spell = true

------------- Keymaps ---------------

local map = vim.keymap.set
local opts = { noremap = false, buffer = true }
-- Wrap selection in link
map("v", ",l", 'c[<C-r>"]()<Esc>h', opts)
-- Wrap selection in image
map("v", ",i", 'c![<C-r>"](?raw=true)<Esc>9h', opts)

-------------- cmp ------------------

local cmp = require("cmp")
cmp.setup.buffer({
  sources = {
    { name = "spell" },
    { name = "buffer" },
    { name = "path" },
  },
  experimental = {
    ghost_text = false,
  },
})
