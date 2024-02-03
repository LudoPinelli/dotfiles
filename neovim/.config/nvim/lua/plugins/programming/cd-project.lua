return {
  "LintaoAmons/cd-project.nvim",
  config = function()
    require("cd-project").setup({
      choice_format = "both",
      projects_picker = "telescope",
    })
  end,
}
