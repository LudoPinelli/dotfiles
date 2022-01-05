local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
	return
end
impatient.enable_profile()

-- disable vimL filetype detection / unable lua filetype detection
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

require("options")
require("plugins")
require("plugConfig")
require("theme")
