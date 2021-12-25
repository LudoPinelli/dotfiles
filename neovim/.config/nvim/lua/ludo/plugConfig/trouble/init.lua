local trouble = require("trouble")

trouble.setup {}

vim.api.nvim_set_keymap("n", "<Leader>xx", "<Cmd>Trouble<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<Leader>xw", "<Cmd>Trouble workspace_diagnostics<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<Leader>xd", "<Cmd>Trouble document_diagnostics<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<Leader>xl", "<Cmd>Trouble loclist<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<Leader>xq", "<Cmd>Trouble quickfix<CR>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<Leader>xr", "<Cmd>Trouble lsp_references<CR>",
  {silent = true, noremap = true}
)
