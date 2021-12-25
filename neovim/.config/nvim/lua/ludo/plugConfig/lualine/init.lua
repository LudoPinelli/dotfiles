local lualine = require("lualine")
local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = false,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
  cond = hide_in_width
}

local filetype = {
	"filetype",
	icons_enabled = true,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local mode = {
  "mode",
  separator = { left = "" }
}

local location = {
  "location",
  separator = { right = "" },
  left_padding = 2,
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = "|",
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { "filename", branch, diff, diagnostics },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { filetype, "progress" },
		lualine_z = { location },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})
