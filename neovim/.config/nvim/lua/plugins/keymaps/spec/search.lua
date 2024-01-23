local wk = require("which-key")

wk.register({
  ["<Leader>"] = {
    s = {
      name = "   Search",

      b = {
        "<Cmd>Telescope buffers initial_mode=normal<CR>",
        "  Buffers",
      },
      c = { "<Cmd>Telescope commands<CR>", "  Commands" },
      C = { "<Cmd>lua Nvim_config()<CR>", "  Config Files" },
      f = { "<Cmd>Telescope find_files<CR>", "  Files" },
      h = { "<Cmd>Telescope help_tags<CR>", "  Help" },
      H = { "<Cmd>lua Home()<CR>", "  Home Directory" },
      i = {
        "<Cmd>Telescope command_history initial_mode=normal<CR>",
        "  Commands History",
      },
      k = { "<Cmd>Telescope keymaps<CR>", "  Keymaps" },
      l = { "<Cmd>Telescope resume<CR>", "  Resume last search" },
      m = { "<Cmd>Telescope marks<CR>", "  Marks" },
      M = { "<Cmd>Telescope man_pages<CR>", "󰧮  Man Pages" },
      p = { "<Cmd>Telescope pickers<CR>", "ﭣ  Previous pickers used" },
      r = {
        "<Cmd>Telescope registers inital_mode=normal<CR>",
        "  Registers",
      },
      s = { "<Cmd>Telescope symbols<CR>", "§  Symbols" },
      t = { "<Cmd>Telescope live_grep<CR>", "󰺯  Text" },
      w = {
        "<Cmd>Telescope grep_string<CR>",
        "Ref. of word under cursor",
      },
      ["/"] = {
        function()
          require("telescope.builtin").current_buffer_fuzzy_find(
            require("telescope.themes").get_dropdown({
              winblend = 10,
              previewer = false,
            })
          )
        end,
        "Fuzzily search in current buffer",
      },
    },
  },
})
