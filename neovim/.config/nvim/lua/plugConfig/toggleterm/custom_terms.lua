local Terminal = require("toggleterm.terminal").Terminal

-- LazyGit
local lazygit = Terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	direction = "float",
	float_opts = {
		border = "curved",
	},
	close_on_exit = true,
	on_open = function()
		vim.cmd("startinsert!")
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
	on_open = function()
		vim.cmd("startinsert!")
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
	on_open = function()
		vim.cmd("startinsert!")
	end,
})
function node_toggle()
	node:toggle()
end

-- Open Htop
local btop = Terminal:new({
	cmd = "btop",
	dir = "~/",
	direction = "float",
	float_opts = {
		border = "curved",
	},
	close_on_exit = true,
	on_open = function()
		vim.cmd("startinsert!")
	end,
})
function btop_toggle()
	btop:toggle()
end

-- Launch cargo watch
local cargo_watch = Terminal:new({
	cmd = "cargo watch -q -c -x 'run -q'",
	dir = "git_dir",
	direction = "horizontal",
	close_on_exit = true,
	on_open = function()
		vim.cmd(":wincmd k")
	end,
})
function cargo_watch_toggle()
	cargo_watch:toggle()
end
