local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
	return
end
impatient.enable_profile()

require("ludo.options")
require("ludo.plugins")
require("ludo.keymaps")
require("ludo.theme")
require("ludo.plugConfig")
