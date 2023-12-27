return {
  "windwp/nvim-autopairs",
  event = "VeryLazy",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,
      ts_config = {
        lua = { "string", "source" },
      },
      disable_filetype = { "TelescopePrompt" },
    })

    require("cmp").event:on(
      "confirm_done",
      require("nvim-autopairs.completion.cmp").on_confirm_done({})
    )
  end,
}
