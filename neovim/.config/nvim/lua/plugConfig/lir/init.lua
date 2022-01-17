local actions = require("lir.actions")
local mark_actions = require("lir.mark.actions")
local clipboard_actions = require("lir.clipboard.actions")

require("lir").setup({
	show_hidden_files = true,
	devicons_enable = true,
	mappings = {
		["l"] = actions.edit,
		["es"] = actions.split,
		["ev"] = actions.vsplit,
		["et"] = actions.tabedit,

		["h"] = actions.up,
		["q"] = actions.quit,

		["N"] = actions.mkdir,
		["n"] = actions.newfile,
		["r"] = actions.rename,
		["@"] = actions.cd,
		["Y"] = actions.yank_path,
		["."] = actions.toggle_show_hidden,
		["d"] = actions.delete,

		["<Space>"] = function()
			mark_actions.toggle_mark()
			vim.cmd("normal! j")
		end,
		["cc"] = clipboard_actions.copy,
		["cx"] = clipboard_actions.cut,
		["cp"] = clipboard_actions.paste,
	},
	float = {
		winblend = 15,
		curdir_window = {
			enable = false,
			highlight_dirname = false,
		},

		-- You can define a function that returns la table to b passed as the third
		-- argument of nvim_open_win().
		win_opts = function()
			local width = math.floor(vim.o.columns * 0.3)
			local height = math.floor(vim.o.lines * 0.6)
			return {
				border = require("lir.float.helper").make_border_opts({
					"╭",
					"─",
					"╮",
					"│",
					"╯",
					"─",
					"╰",
					"│",
				}, "Normal"),
				width = width,
				height = height,
				row = 6,
				col = math.floor((vim.o.columns - width) / 2),
			}
		end,
	},
	hide_cursor = true,
	on_init = function()
		-- use visual mode
		vim.keymap.set(
			"x",
			"J",
			':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
			{ noremap = true, silent = true, buffer = 0 }
		)

		-- echo cwd
		vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
	end,
})

-- custom folder icon
require("nvim-web-devicons").set_icon({
	lir_folder_icon = {
		icon = "",
		color = "#96CDF8",
		name = "LireFolderNode",
	},
})

require("lir.git_status").setup({
	show_ignored = false,
})
