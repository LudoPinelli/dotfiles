return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      hijack_cursor = true,
      view = {
        width = 35,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      update_focused_file = {
        enable = true,
      },
      git = {
        enable = false,
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      select_prompts = true,
    })
  end,
}
