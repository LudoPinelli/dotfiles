return {
  "folke/trouble.nvim",
  requires = "nvim-tree/nvim-web-devicons",
  cmd = { "TroubleToggle", "Trouble" },
  opts = { use_diagnostic_signs = true },
  config = function()
    require("trouble").setup({})

    local telescope = require("telescope")
    local trouble = require("trouble.providers.telescope")
    telescope.setup({
      defaults = {
        mappings = {
          i = { ["<C-t>"] = trouble.open_with_trouble },
          n = { ["<C-t>"] = trouble.open_with_trouble },
        },
      },
    })
  end,
}
