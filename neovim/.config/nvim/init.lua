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

-- Mapleader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup({
    { import = 'plugins' },
    { import = "plugins.lsp" }
  },
  {
    dev = {
      path = "~/dev/neovim",
      patterns = { "LudoPinelli" },
      fallback = false,
    },
    checker = {
      enabled = false,
    },
  })

require('options')
require('autocommands')
require('keymaps')
require('autoformat')
