-- ── Keymaps ───────────────────────────────────────────────────────────

local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    r = {
      name = "   Rust",

      a = { "<Cmd>RustLsp hover actions<CR>", "Hover Actions" },
      b = { "<Cmd>Cbuild<CR>", "Cargo Build" },
      c = { "<Cmd>Ccheck<CR>", "Cargo Check" },
      d = { "<Cmd>RustLsp debuggables<CR>", "Debugging" },
      g = { "<Cmd>RustLsp crateGraph<CR>", "Crate Graph" },
      j = { "<Cmd>RustLsp joinlines<CR>", "Join Lines" },
      t = { "<Cmd>Ctest<CR>", "Cargo Test" },
      r = { "<Cmd>Crun<CR>", "Cargo Run" },
    },
  },
})

-- ── cmp ───────────────────────────────────────────────────────────────

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
