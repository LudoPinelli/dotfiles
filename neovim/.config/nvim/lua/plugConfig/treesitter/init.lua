local status_ok, nvim_treessitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

nvim_treessitter_configs.setup({
	ensure_installed = { -- "all", "maintained" or list of languages
		"bash",
		"c",
		"cmake",
		"comment",
		"cpp",
		"css",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"json5",
		"latex",
		"lua",
		"make",
		"python",
		"regex",
		"rust",
		"toml",
		"vim",
	},
	sync_install = false,
	-- ignore_install = { "" },

	highlight = {
		enable = true,
		-- disable = { "" },
		additional_vim_regex_highlighting = false,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},

	refactor = {
		highlight_definitions = { enable = true },
	},
})

-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.fillchars:append({ vert = "┃", fold = " " })
-- vim.opt.fillchars:append({ foldopen = "▾", foldsep = "│", foldclose = "▸" })