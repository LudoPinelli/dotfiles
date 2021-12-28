local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	return
end

trouble.setup({})

local Utils = require("ludo.keymaputils")
local nnoremap = Utils.nnoremap

nnoremap("<Leader>xx", "<Cmd>Trouble<CR>")
nnoremap("<Leader>xw", "<Cmd>Trouble workspace_diagnostics<CR>")
nnoremap("<Leader>xd", "<Cmd>Trouble document_diagnostics<CR>")
nnoremap("<Leader>xl", "<Cmd>Trouble loclist<CR>")
nnoremap("<Leader>xq", "<Cmd>Trouble quickfix<CR>")
nnoremap("<Leader>xr", "<Cmd>Trouble lsp_references<CR>")
