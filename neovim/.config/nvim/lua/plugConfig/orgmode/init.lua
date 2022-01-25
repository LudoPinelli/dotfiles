require("orgmode").setup({
	org_agenda_files = { "~/Org/**/*" },
	org_default_notes_file = "~/Org/refile.org",
})

vim.cmd([[highlight Headline1 guibg=#1e3728]])
vim.cmd([[highlight Headline1 guibg=#21262d]])
vim.cmd([[highlight CodeBlock guibg=#1c1c1c]])

require("headlines").setup({
	org = {
		headline_highlights = { "Headline1", "Headline2", "CodeBlock" },
	},
})
