return {
  "rubiin/fortune.nvim",
  version = "*",
  config = function()
    require("fortune").setup({
      display_format = "short",
    })
  end,
}
