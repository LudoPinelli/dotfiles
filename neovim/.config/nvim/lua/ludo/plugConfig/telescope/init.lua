local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end
local actions = require("telescope.actions")

telescope.setup({

	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		dynamic_preview_title = true,
		winblend = 4,
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
			horizontal = {
				width_padding = 0.04,
				height_padding = 0.1,
				preview_width = 0.6,
			},
			vertical = {
				width_padding = 0.05,
				height_padding = 1,
				preview_height = 0.5,
			},
		},

		mappings = {
			i = {
				["<Esc>"] = actions.close,

				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key,
			},

			n = {
				["<Esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},

	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" },
		},
		-- Default config for builtin pickers:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- picker_config_key will be applied every time this is called:
		-- builtin picker
	},
	extensions = {
		-- Extension conf:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")

-- keymaps
local Utils = require("ludo.keymaputils")
local nnoremap = Utils.nnoremap

nnoremap("<Leader>ff", "<Cmd>Telescope find_files<CR>")
nnoremap("<Leader>fg", "<Cmd>Telescope live_grep<CR>")
nnoremap("<Leader>fb", "<Cmd>Telescope buffers<CR>")
nnoremap("<Leader>fh", "<Cmd>Telescope help_tags<CR>")
nnoremap("<Leader>fd", "<Cmd>Telescope diagnostics<CR>")

-- Custom pickers
local M = {}

function M.nvim_config()
	require("telescope").extensions.file_browser.file_browser({
		prompt_title = " Neovim Configuration",
		prompt_position = "top",
		path = "~/.dotfiles/neovim/.config/nvim/",
		cwd = "~/.dotfiles/neovim/.config/nvim/",
		depth = 4,
		sorting_strategy = "ascending",
	})
end

function M.cheat_sheet()
	require("telescope.builtin").find_files({
		prompt_title = "  Cheat Sheets",
		prompt_position = "top",
		cwd = "~/Documents/CheatSheets/",
		search_dirs = { "~/Documents/CheatSheets" },
	})
end

return M
