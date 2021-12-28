require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.norg.concealer"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					cheat_sheet = "~/Documents/CheatSheets",
				},
			},
		},
		["core.norg.completion"] = {
			config = { engine = "nvim-cmp" },
		},
		["core.integrations.telescope"] = {},
	},

	hook = function()
		local neorg_leader = "<Leader>"
		local neorg_callbacks = require("neorg.callbacks")
		neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
			keybinds.map_event_to_mode("norg", {
				n = {
					{ "gtd", "core.norg.qol.todo_items.todo.task_done" },
					{ "gtu", "core.norg.qol.todo_items.todo.task_undone" },
					{ "gtp", "core.norg.qol.todo_items.todo.task_pending" },
					{ "<C-Space>", "core.norg.qol.todo_items.todo.task_cycle" },
					{ "<Leader>fl", "core.integrations.telescope.find_linkable" },
				},
				i = {
					{ "<C-l>", "core.integrations.telescope.insert_link" },
				},
			}, { silent = true, noremap = true })
		end)
	end,
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

parser_config.norg = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg",
		files = { "src/parser.c", "src/scanner.cc" },
		branch = "main",
	},
}
parser_config.norg_meta = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
		files = { "src/parser.c" },
		branch = "main",
	},
}
parser_config.norg_table = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
		files = { "src/parser.c" },
		branch = "main",
	},
}
