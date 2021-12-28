local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<CR>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<C-d>", -- binding to scroll down inside the popup
		scroll_up = "<C-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 10,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<Silent>", "<Cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<Leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<Space>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

require("ludo.plugConfig.toggleterm")

local mappings = {
	["a"] = { "<Cmd>Alpha<CR>", "  Landing page" },
	["b"] = { "<Cmd>lua require('telescope.builtin').buffers()<CR>", " Buffers" },
	["c"] = { "<Cmd>BufferClose<CR>", " Close Buffer" },
	["e"] = { "<Cmd>NvimTreeToggle<CR>", "פּ Explorer" },
	["ff"] = { "<Cmd>Telescope find_files<CR>", "  Find files" },
	["fg"] = { "<Cmd>Telescope live_grep<CR>", " Find Text" },
	["h"] = { "<Cmd>nohlsearch<CR>", "  No Highlight" },
	["q"] = { "<Cmd>q!<CR>", "  Quit" },
	["w"] = { "<Cmd>w!<CR>", "  Save" },

	g = {
		name = "   Git",

		g = { "<Cmd>lua lazygit_toggle()<CR>", " LazyGit" },
		j = { "<Cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
		k = { "<Cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
		p = { "<Cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
		r = { "<Cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
		R = { "<Cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
		s = { "<Cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
		u = {
			"<Cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
			"Undo Stage Hunk",
		},
		o = { "<Cmd>Telescope git_status<CR>", "Open changed file" },
		b = { "<Cmd>Telescope git_branches<CR>", " Checkout branch" },
		c = { "<Cmd>Telescope git_commits<CR>", "  Checkout commit" },
		d = { ":DiffviewOpen<CR>", "  Diff" },
	},

	l = {
		name = "   LSP",

		a = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
		d = {
			"<Cmd>Trouble document_diagnostics<CR>",
			"Document Diagnostics",
		},
		w = {
			"<Cmd>Trouble workspace_diagnostics<CR>",
			"Workspace Diagnostics",
		},
		f = { "<Cmd>lua vim.lsp.buf.formatting()<CR>", "  Format" },
		i = { "<Cmd>LspInfo<CR>", "  Info" },
		I = { "<Cmd>LspInstallInfo<CR>", "Installer Info" },
		l = { "<Cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
		q = { "<Cmd>Trouble quickfix<CR>", "Quickfix" },
		r = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "凜  Rename" },
		s = { "<Cmd>Telescope lsp_document_symbols<CR>", "  Document Symbols" },
		S = {
			"<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
			"  Workspace Symbols",
		},
		R = { "<Cmd>Trouble lsp_references<CR>", "Ref. of word under cursor" },
	},

	s = {
		name = "   Search",
		h = { "<Cmd>Telescope help_tags<CR>", "  Help" },
		f = { "<Cmd>Telescope find_files<CR>", "  Files" },
		t = { "<Cmd>Telescope live_grep<CR>", " Text" },
		M = { "<Cmd>Telescope man_pages<CR>", " Man Pages" },
		r = { "<Cmd>Telescope oldfiles<CR>", "  Open Recent File" },
		R = { "<Cmd>Telescope registers<CR>", "  Registers" },
		k = { "<Cmd>Telescope keymaps<CR>", "  Keymaps" },
		c = { "<Cmd>Telescope commands<CR>", "  Commands" },
		H = { "<Cmd>Telescope command_history<CR>", "  Commands History" },
		m = { "<Cmd>Telescope notify<CR>", "  Messages History" },
		C = { "<Cmd>lua require('ludo.plugConfig.telescope').cheat_sheet()<CR>", "  Cheat Sheets" },
	},

	t = {
		name = "   Terminal",
		f = { "<Cmd>ToggleTerm direction=float<CR>", " Float" },
		h = { "<Cmd>ToggleTerm size=10 direction=horizontal<CR>", " Horizontal" },
		v = { "<Cmd>ToggleTerm size=80 direction=vertical<CR>", " Vertical" },
		s = { "<Cmd>lua lazygit_toggle()<CR>", " LazyGit" },
		p = { "<Cmd>lua python_toggle()<CR>", " Python" },
		n = { "<Cmd>lua node_toggle()<CR>", " Node.js" },
		t = { "<Cmd>lua htop_toggle()<CR>", "  Htop" },
		w = { "<Cmd>lua cargo_watch_toggle()<CR>", " Cargo Watch" },
	},
	x = {
		name = "   Trouble",
		d = { "<Cmd>Trouble document_diagnostics<CR>", "Document Diagnostics" },
		w = { "<Cmd>Trouble workspace_diagnostics<CR>", "Workspace Diagnostics" },
		v = { "<Cmd>Trouble loclist<CR>", "Loclist" },
		q = { "<Cmd>Trouble quickfix<CR>", "Quickfix" },
		r = { "<Cmd>Trouble lsp_references<CR>", "Ref. of word under cursor" },
		t = { "<Cmd>Trouble lsp_type_definitions<CR>", "Type Definition" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
