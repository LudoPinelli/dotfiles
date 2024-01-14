require("options")
require("autocommands")
require("neovide")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ── Mapleader ─────────────────────────────────────────────────────────

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ── Setup ─────────────────────────────────────────────────────────────

require("lazy").setup({
  { import = "plugins.ui" },
  { import = "plugins.edition" },
  { import = "plugins.lsp" },
  { import = "plugins.programming" },
  { import = "plugins.git" },
  { import = "plugins.ai" },
  { import = "plugins.keymaps" },
}, {
  dev = {
    path = "~/dev/neovim",
    patterns = { "LudoPinelli" },
    fallback = false,
  },
  checker = {
    enabled = false,
  },
})
