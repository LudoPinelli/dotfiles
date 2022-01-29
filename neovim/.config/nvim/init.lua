-- local status_ok, impatient = pcall(require, "impatient")
-- if not status_ok then
--	return
-- end
-- impatient.enable_profile()

if jit.os ~= "Windows" then
	-- disable vimL filetype detection / unable lua filetype detection
	vim.g.did_load_filetypes = 0
	vim.g.do_filetype_lua = 1
end

require("autocommands")
require("options")
require("keymaps")
require("plugins")
require("plugConfig")
require("theme")
