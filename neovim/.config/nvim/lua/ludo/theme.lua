local nightfox = require("nightfox")

nightfox.setup({
	fox = "nordfox",
	styles = { functions = "italic" },
	inverse = { match_paren = true },
	hlgroups = {
		-- TSVariable = { fg = "#d2d4d7" },
		-- TSType = { fg = "#ced187" },
	},
})

nightfox.load()
