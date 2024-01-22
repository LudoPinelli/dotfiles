return {
  "dustinblackman/oatmeal.nvim",
  cmd = { "Oatmeal" },
  keys = {
    { "<leader>am", mode = "n", desc = "Start Oatmeal session" },
  },
  opts = {
    backend = "ollama",
    model = "codellama:latest",
  },
}
