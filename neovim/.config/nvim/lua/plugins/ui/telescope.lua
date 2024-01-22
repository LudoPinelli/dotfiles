return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  tag = "0.1.5",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "natecraddock/telescope-zf-native.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    { "nvim-telescope/telescope-symbols.nvim" },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      path_display = { "smart" },
      dynamic_preview_title = true,
      winblend = 0,
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "bottom",
        height = 0.95,
      },
      mappings = {
        n = {
          ["q"] = "close",
          ["l"] = "select_default",
        },
      },
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
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("zf-native")
    require("telescope").load_extension("file_browser")
  end,
}
