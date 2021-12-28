local status_ok, neoclip = pcall(require, "neoclip")
if not status_ok then
	return
end

neoclip.setup({
	keys = {
		telescope = {
			i = {
				select = "<CR>",
				paste = "<C-p>",
				paste_behind = "<C-P>",
			},
		},
	},
})

require("telescope").load_extension("neoclip")

-- Keymaps
local Utils = require("ludo.keymaputils")
local nnoremap = Utils.nnoremap

nnoremap("<Leader>n", ":Telescope neoclip<CR>")
