local theme = "kanagawa"

if theme == "nightfox" then
	local status_ok, nightfox = pcall(require, "nightfox")
	if not status_ok then
		return
	end

	nightfox.setup({
		fox = "nordfox",
		styles = {
			comments = "italic",
			-- functions = "italic",
		},
		inverse = {
			match_paren = true,
		},
	})

	nightfox.load("nordfox")
elseif theme == "kanagawa" then
	local default_colors = require("kanagawa.colors").setup()

	local my_colors = {}

	local overrides = {
		NvimTreeNormal = { fg = default_colors.fg, bg = default_colors.bg_status },
	}

	require("kanagawa").setup({ overrides = overrides, colors = my_colors })
	vim.cmd("colorscheme kanagawa")
end
