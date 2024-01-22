---@diagnostic disable: missing-fields
return {
  "saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("crates").setup({
      src = {
        cmp = {
          enabled = true,
        },
      },
      popup = {
        autofocus = true,
        hide_on_select = true,
      },
    })
    local crates = require("crates")

    vim.keymap.set(
      "n",
      "<Leader>Cv",
      crates.show_versions_popup,
      { silent = true, desc = "Crates: show versions" }
    )
    vim.keymap.set(
      "n",
      "<Leader>Cf",
      crates.show_features_popup,
      { silent = true, desc = "Crates: show features" }
    )
    vim.keymap.set(
      "n",
      "<Leader>Cd",
      crates.show_dependencies_popup,
      { silent = true, desc = "Crates: show dependencies" }
    )
  end,
}
