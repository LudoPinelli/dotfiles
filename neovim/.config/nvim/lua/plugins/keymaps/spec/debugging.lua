local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    d = {
      name = "   Debugging",
      b = {
        "<Cmd>lua require'dap'.toggle_breakpoint()<CR>",
        "  Toggle breakpoint",
      },
      c = { "<Cmd>lua require'dap'.continue()<CR>", "  Continue" },
      C = {
        "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
        "  Conditional breakpoint",
      },
      d = {
        "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
        "  Log point",
      },
      i = { "<Cmd>lua require'dap'.step_into()<CR>", "  Step into" },
      o = { "<Cmd>lua require'dap'.step_over()<CR>", "  Step over" },
      O = { "<Cmd>lua require'dap'.step_out()<CR>", "  Step out" },
    },
  },
})
