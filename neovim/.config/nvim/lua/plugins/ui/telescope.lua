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
    local trouble = require("trouble.providers.telescope")
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
        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<C-c>"] = actions.close,

            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,

            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,

            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection
              + actions.move_selection_better,
            ["<C-q>"] = trouble.open_with_trouble,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.complete_tag,
            ["<C-_>"] = actions.which_key,
          },

          n = {
            ["C-c"] = actions.close,
            ["<Esc>"] = actions.close,

            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,

            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection
              + actions.move_selection_better,
            ["<C-q>"] = trouble.open_with_trouble,
            ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["l"] = actions.select_default,
            ["H"] = actions.move_to_top,
            ["M"] = actions.move_to_middle,
            ["L"] = actions.move_to_bottom,

            ["<Down"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,

            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,

            ["?"] = actions.which_key,
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
