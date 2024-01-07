return {
  "nvimdev/lspsaga.nvim",
  -- dependencies = {
  --   "simrat39/rust-tools.nvim",
  -- },
  config = function()
    require("neodev").setup()

    require("lspsaga").setup({
      ui = {
        border = "rounded",
        code_action = "",
      },
      outline = {
        win_width = 40,
        close_after_jump = true,
        layout = "normal",
      },
    })

    -- error lens
    vim.fn.sign_define({
      {
        name = "DiagnosticSignError",
        text = "",
        texthl = "DiagnosticSignError",
        linehl = "ErrorLine",
      },
      {
        name = "DiagnosticSignWarn",
        text = "",
        texthl = "DiagnosticSignWarn",
        linehl = "WarningLine",
      },
      {
        name = "DiagnosticSignInfo",
        text = "",
        texthl = "DiagnosticSignInfo",
        linehl = "InfoLine",
      },
      {
        name = "DiagnosticSignHint",
        text = "",
        texthl = "DiagnosticSignHint",
        linehl = "HintLine",
      },
    })
  end,
}
