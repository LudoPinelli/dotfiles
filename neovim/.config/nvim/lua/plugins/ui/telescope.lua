return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = vim.fn.executable("make") == 1,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-telescope/telescope-symbols.nvim",
  },
  cmd = "Telescope",
  config = function()
    local actions = require("telescope.actions")
    require("telescope").setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        dynamic_preview_title = true,
        winblend = 0,
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
          prompt_position = "bottom",
          height = 0.95,
        },
        mappings = {},
      },
      file_ignore_patterns = {
        "lazy-lock.json",
      },
      pickers = {
        -- Default config for builtin pickers:
        find_files = {
          hidden = true,
        },
      },
      pcall(require("telescope").load_extension, "file_browser"),
      extensions = {
        file_browser = {
          prompt_title = "פּ  Browser",
          initial_mode = "normal",
          sorting_strategy = "ascending",
          grouped = true,
          hidden = true,
          respect_gitignore = true,
          hide_paren_dir = true,
          hijack_netrw = true,
          mappings = {
            ["n"] = {
              ["q"] = actions.close,
              ["l"] = actions.select_default,
            },
          },
        },
      },
      pcall(require("telescope").load_extension, "fzf"),
    })
  end,
}
