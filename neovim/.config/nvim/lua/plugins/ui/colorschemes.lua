return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = false,
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = { "bold" },
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}

-- return {
--   "ramojus/mellifluous.nvim",
--   config = function()
--     require("mellifluous").setup({
--       color_set = "mountain",
--     })
--     vim.cmd("colorscheme mellifluous")
--   end,
-- }

-- return {
--   "rebelot/kanagawa.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("kanagawa").setup({
--       compile = true,
--       dimInactive = true,
--     })
--     vim.cmd("colorscheme kanagawa-wave")
--     -- vim.cmd("colorscheme kanagawa-dragon")
--     -- vim.cmd("colorscheme kanagawa-lotus")
--   end,
--   override = function(colors)
--     local theme = colors.theme
--     return {
--       NormalFloat = { bg = "none" },
--       FloatBorder = { bg = "none" },
--       FloatTitle = { bg = "none" },
--       NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
--       LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
--       MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
--       Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
--       PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
--       PmenuSbar = { bg = theme.ui.bg_m1 },
--       PmenuThumb = { bg = theme.ui.bg_p2 },
--     }
--   end,
-- }
