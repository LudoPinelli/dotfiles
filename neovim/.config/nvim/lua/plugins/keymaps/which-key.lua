return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      operators = { gc = "Comments" },
      motions = {
        count = true,
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      popup_mappings = {
        scroll_down = "<C-d>",
        scroll_up = "<C-u>",
      },
      window = {
        border = "single",
        position = "bottom",
        margin = { 1, 1, 1, 1 },
        padding = { 1, 1, 1, 1 },
        winblend = 15,
        zindex = 1000,
      },
      layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "center",
      },
      ignore_missing = false,
      ---@diagnostic disable-next-line: assign-type-mismatch
      hidden = {
        "<Silent>",
        "<Cmd>",
        "<Cmd>",
        "<CR>",
        "^call",
        "^lua",
        "^:",
        "^ ",
      },
      show_help = true,
      how_keys = true,
      triggers = "auto",
      triggers_nowait = {
        -- marks
        "`",
        "'",
        "g`",
        "g'",
        -- registers
        '"',
        "<c-r>",
        -- spelling
        "z=",
      },
      triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
      },
      disable = {
        buftypes = {},
        filetypes = {},
      },
    })

    --                             ╭──────────────────╮
    --                             │ Helper functions │
    --                             ╰──────────────────╯

    -- ▲
    -- █ Browser in .dotfiles/
    -- ▼
    function Get_path()
      if jit.os == "Windows" then
        return "$LOCALAPPDATA/nvim/"
      else
        return "~/.config/nvim/"
      end
    end

    -- ▲
    -- █ Neovim config files
    -- ▼
    function Nvim_config()
      local path = Get_path()
      require("telescope").extensions.file_browser.file_browser({
        prompt_title = " Neovim Configuration",
        initial_mode = "normal",
        sorting_strategy = "ascending",
        path = path,
        cwd = path,
        grouped = true,
        hidden = true,
        respect_gitignore = true,
        hide_paren_dir = true,
      })
    end

    -- ▲
    -- █ Find files in home directory
    -- ▼
    function Home()
      local path = "~/"
      require("telescope.builtin").find_files({
        prompt_title = "  Home Directory",
        cwd = path,
        hidden = false,
        search_dirs = {
          ".config",
          ".dotfiles",
          ".local",
          "bin",
          "dev",
          "Documents",
        },
      })
    end

    -- ▲
    -- █ File browser
    -- ▼
    function Explorer()
      require("telescope").extensions.file_browser.file_browser({
        prompt_title = "פּ  Explorer",
        initial_mode = "normal",
        sorting_strategy = "ascending",
        grouped = true,
        auto_depth = true,
        hidden = true,
        respect_gitignore = true,
        hide_paren_dir = true,
        mappings = {
          n = {
            ["q"] = require("telescope.actions").close,
          },
        },
      })
    end

    require("plugins.keymaps.spec.general")
    require("plugins.keymaps.spec.base")
    require("plugins.keymaps.spec.buffers")
    require("plugins.keymaps.spec.search")
    require("plugins.keymaps.spec.lists")
    require("plugins.keymaps.spec.toggleterm")
    require("plugins.keymaps.spec.git")
    require("plugins.keymaps.spec.lsp")
    require("plugins.keymaps.spec.box")
    require("plugins.keymaps.spec.debugging")
    require("plugins.keymaps.spec.ai")
    require("plugins.keymaps.spec.obsidian")
    require("plugins.keymaps.spec.projects")
    require("plugins.keymaps.spec.messages")
  end,
}
