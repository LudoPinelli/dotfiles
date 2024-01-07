return {
  "hedyhli/outline.nvim",
  config = function()
    require("outline").setup({
      outline_window = {
        auto_close = true,
      },
      outline_items = {
        show_symbol_lineno = true,
      },
    })
  end,
}
