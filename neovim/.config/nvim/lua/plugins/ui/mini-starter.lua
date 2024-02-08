return {
  "echasnovski/mini.starter",
  version = false,
  config = function()
    require("mini.starter").setup({
      footer = function()
        local fortune = table.concat(require("fortune").get_fortune(), "\n")
        return fortune
      end,
    })
  end,
}
