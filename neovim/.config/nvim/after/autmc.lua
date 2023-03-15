
vim.api.nvim_create_autocmd("BufRead", {
  group = vim.api.nvim_create_augroup("aerial", { clear = true }),
  pattern = { "*.lua", "*.rs" },
  command = "AerialToggle!",
})
