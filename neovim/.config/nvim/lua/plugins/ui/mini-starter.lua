return {
  "echasnovski/mini.starter",
  version = false,
  config = function()
    require("mini.starter").setup({
      footer = function()
        return os.date("__ %A %d %B - %Hh%M __")
      end,
    })
  end,
}
