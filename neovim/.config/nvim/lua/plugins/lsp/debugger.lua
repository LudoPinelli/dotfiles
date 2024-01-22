return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("dapui").setup()
    local dap = require("dap")
    local dapui = require("dapui")

    -- dap.adapters.codelldb = {
    --   type = "server",
    --   port = "${port}",
    --   executable = {
    --     command = "/home/ludo/.local/bin/codelldb/extension/adapter/codelldb",
    --     args = { "--port", "${port}" },
    --   },
    -- }
    -- dap.configurations.rust = {
    --   {
    --     name = "Launch file",
    --     type = "codelldb",
    --     request = "launch",
    --     program = function()
    --       return vim.fn.input(
    --         "Path to executable: ",
    --         vim.fn.getcwd() .. "/target/debug/",
    --         "file"
    --       )
    --     end,
    --     cwd = "${workspaceFolder}",
    --     stopOnEntry = false,
    --   },
    -- }

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.fn.sign_define(
      "DapBreakpoint",
      { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" }
    )
    vim.fn.sign_define("DapBreakpointCondition", {
      text = "",
      texthl = "DapBreakpointCondition",
      linehl = "",
      numhl = "",
    })
    vim.fn.sign_define(
      "DapLogPoint",
      { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" }
    )
    vim.fn.sign_define(
      "DapStopped",
      { text = "", texthl = "DapStopped", linehl = "", numhl = "" }
    )
    vim.fn.sign_define(
      "DapBreakpointRejected",
      { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" }
    )
  end,
}
