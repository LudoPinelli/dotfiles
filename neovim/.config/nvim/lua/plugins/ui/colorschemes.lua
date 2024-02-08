return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
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
        integrations = {
          cmp = true,
          gitsigns = true,
          treesitter = true,
          noice = true,
          mason = true,
          dap_ui = true,
          lsp_saga = true,
          markdown = true,
          telescope = true,
          which_key = true,
        },
      })

      require("lualine").setup({
        options = {
          theme = "catppuccin",
        },
      })
    end,
  },
  {
    "ramojus/mellifluous.nvim",
    lazy = true,
    config = function()
      require("mellifluous").setup({
        color_set = "mountain",
      })
      vim.cmd("colorscheme mellifluous")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
      require("kanagawa").setup({
        compile = true,
        dimInactive = true,
      })
      vim.cmd("colorscheme kanagawa-wave")
      -- vim.cmd("colorscheme kanagawa-dragon")
      -- vim.cmd("colorscheme kanagawa-lotus")

      require("lualine").setup({
        options = {
          theme = "kanagawa-wave",
          -- theme = "kanagawa-dragon",
          -- theme = "kanagawa-lotus",
        },
      })
    end,
    override = function(colors)
      local theme = colors.theme
      return {
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },
        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
        PmenuSbar = { bg = theme.ui.bg_m1 },
        PmenuThumb = { bg = theme.ui.bg_p2 },
      }
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          styles = {
            comments = "italic",
            functions = "bold",
          },
          dim_inactive = true,
        },
      })
      vim.cmd.colorscheme("nightfox")
    end,
  },
}
