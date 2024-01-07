return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",
      transparent_background = false,
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
      },
      styles = {
        comments = {},
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
