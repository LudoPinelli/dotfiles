local theme = "catppuccin"

-- Nightfox
if theme == "nightfox" then
	local nightfox = require("nightfox")

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

	-- kanagawa
elseif theme == "kanagawa" then
	local default_colors = require("kanagawa.colors").setup()
	local my_colors = {}
	local overrides = {
		NvimTreeNormal = { fg = default_colors.fg, bg = default_colors.bg_status },
	}

	require("kanagawa").setup({ overrides = overrides, colors = my_colors })
	vim.cmd("colorscheme kanagawa")

	-- Catppuccin
elseif theme == "catppuccin" then
	local catppuccin = require("catppuccin")

	catppuccin.setup({
		transparent_background = false,
		term_colors = false,
		styles = {
			comments = "italic",
			functions = "italic",
			keywords = "italic",
			strings = "NONE",
			variables = "italic",
		},
		integrations = {
			treesitter = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "NONE",
					hints = "NONE",
					warnings = "NONE",
					information = "NONE",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
				},
			},
			lsp_trouble = true,
			cmp = true,
			lsp_saga = false,
			gitgutter = false,
			gitsigns = true,
			telescope = true,
			nvimtree = {
				enabled = true,
				show_root = false,
			},
			which_key = true,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = true,
			},
			dashboard = true,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = true,
			bufferline = false,
			markdown = true,
			lightspeed = false,
			ts_rainbow = false,
			hop = false,
			notify = true,
			telekasten = false,
		},
	})
	vim.cmd("colorscheme catppuccin")
end
