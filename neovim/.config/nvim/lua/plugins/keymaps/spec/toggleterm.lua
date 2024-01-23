---@diagnostic disable: assign-type-mismatch
local Terminal = require("toggleterm.terminal").Terminal

-- Open bacon
local bacon = Terminal:new({
  cmd = "bacon -j run",
  dir = "git_dir",
  direction = "vertical",
  close_on_exit = true,
  on_open = function()
    vim.cmd(":wincmd h")
  end,
})
function Bacon_toggle()
  bacon:toggle()
end

-- Open lazygit
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
function Lazygit_toggle()
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
function Python_toggle()
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
function Node_toggle()
  node:toggle()
end

-- Open btop
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
function Btop_toggle()
  btop:toggle()
end

local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    t = {
      name = "   Terminal",
      f = { "<Cmd>ToggleTerm direction=float<CR>", "  Float" },
      g = { "<Cmd>lua Lazygit_toggle()<CR>", "  Lazygit" },
      h = {
        "<Cmd>ToggleTerm size=10 direction=horizontal<CR>",
        "  Horizontal",
      },
      n = { "<Cmd>lua Node_toggle()<CR>", "  Node.js" },
      p = { "<Cmd>lua Python_toggle()<CR>", "   Python" },
      t = { "<Cmd>lua Btop_toggle()<CR>", "   btop" },
      v = {
        "<Cmd>ToggleTerm size=50 direction=vertical<CR>",
        "   Vertical",
      },
    },
  },
})
