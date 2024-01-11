return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-surround").setup({})
  end,
}
