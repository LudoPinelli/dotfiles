local toggleterm = require("toggleterm")

toggleterm.setup({

	-- size can be a number or function which is passed the current terminal
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,

	open_mapping = [[<c-t>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = "1", -- the degree by which to darken to terminal colour
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	persist_size = true,
	direction = "horizontal", -- 'vertical' | 'horizontal' | 'window' | 'float',
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell, -- change the default shell
	-- This field is only relevant if direction is set to 'float'
	float_opts = {
		-- The border key is *almost* the same as 'nvim_win_open'
		-- see :h nvim_win_open for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		border = "single", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		-- width = <value>,
		-- height = <value>,
		winblend = 3,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

-- back to normal mode in Terminal
local Utils = require("ludo.keymaputils")
local tnoremap = Utils.tnoremap

tnoremap("<ESC>", "<C-\\><C-n>")

-- custom
local M = {}
local Terminal = require("toggleterm.terminal").Terminal

-- Open LazyGit
local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "curved",
	},
	close_on_exit = true,
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
})
function lazygit_toggle()
	lazygit:toggle()
end

-- Open python shell (bpython)
local python = Terminal:new({
	cmd = "bpython",
	dir = vim.fn.expand("%:p"),
	direction = "horizontal",
	close_on_exit = true,
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
})
function python_toggle()
	python:toggle()
end

-- Open Node shell
local node = Terminal:new({
	cmd = "node",
	dir = vim.fn.expand("%:p"),
	direction = "horizontal",
	close_on_exit = true,
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
})
function node_toggle()
	node:toggle()
end

-- Open Htop
local htop = Terminal:new({
	cmd = "htop",
	dir = "~/",
	direction = "float",
	float_opts = {
		border = "curved",
	},
	close_on_exit = true,
	on_open = function(term)
		vim.cmd("startinsert!")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
})
function htop_toggle()
	htop:toggle()
end

-- Launch cargo watch
local cargo_watch = Terminal:new({
	cmd = "cargo watch -q -c -x 'run -q'",
	dir = "git_dir",
	direction = "horizontal",
	close_on_exit = true,
	on_open = function(term)
		vim.cmd(":wincmd k")
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	end,
})
function cargo_watch_toggle()
	cargo_watch:toggle()
end

return M
