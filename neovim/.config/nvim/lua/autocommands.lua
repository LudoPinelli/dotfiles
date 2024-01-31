vim.api.nvim_create_augroup("custom", { clear = true })

-- Highlight on Yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight on yank",
  group = "custom",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Start terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Start terminal in insert mode",
  group = "custom",
  pattern = "*",
  command = "startinsert | set winfixheight",
})

-- Jump to last edit position on opening file
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Jump to last edit position on opening file",
  group = "custom",
  pattern = "*",
  command = 'silent! normal! g`"zv',
})

-- Leave paste mode when leaving insert mode
vim.cmd([[
  autocmd InsertLeave * set nopaste
]])
