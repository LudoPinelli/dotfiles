return {
  "ramojus/mellifluous.nvim",
  config = function()
    require("mellifluous").setup({
      color_set = "mountain",
    })
    vim.cmd("colorscheme mellifluous")
  end,
}
