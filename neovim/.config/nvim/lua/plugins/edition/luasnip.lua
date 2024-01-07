return {
  "L3MON4D3/LuaSnip",
  config = function()
    require("luasnip").setup({
      history = true,
      updateevents = "TextChanged, TextChangedI",
      enable_autosnippets = true,
      ext_opts = {
        [require("luasnip.util.types").choiceNode] = {
          active = {
            virt_text = { { "🟠", "GruveboxOrange" } },
          },
        },
      },
    })
  end,
}
