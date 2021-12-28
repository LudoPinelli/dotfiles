-- vim.cmd([[colorscheme nord]])
--
-- vim.g.nord_contrast = true
-- vim.g.nord_italic = true
-- vim.g.nord_borders = true
-- require("nord").set()

local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
	return
end

nightfox.setup({
	fox = "nordfox",
	styles = {
		comments = "italic",
		functions = "italic",
	},
	inverse = {
		match_paren = true,
	},
})

nightfox.load("nordfox")
