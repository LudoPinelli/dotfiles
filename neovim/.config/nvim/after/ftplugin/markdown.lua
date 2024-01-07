vim.opt_local.spell = true

-- ── Keymaps ───────────────────────────────────────────────────────────

local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    M = {
      name = "   Markdown",
      p = { "<Cmd>MarkdownPreviewToggle<CR>", "Markdown preview" },
    },
  },
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("v", "L", 'c[<C-r>"]()<Esc>h', opts)
map("v", "I", 'c![<C-r>"](?raw=true)<Esc>9h', opts)

-- ── cmp ───────────────────────────────────────────────────────────────

local cmp = require("cmp")
cmp.setup.buffer({
  sources = {
    { name = "nvim_lsp" },
    { name = "spell" },
    { name = "buffer" },
    { name = "path" },
  },
  experimental = {
    ghost_text = false,
  },
})
