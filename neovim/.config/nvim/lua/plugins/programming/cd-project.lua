return {
  "LintaoAmons/cd-project.nvim",
  config = function()
    require("cd-project").setup({
      choice_format = "name",
      projects_picker = "telescope",
    })
  end,
}
