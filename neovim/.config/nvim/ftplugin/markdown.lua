vim.api.nvim_buf_set_keymap(
	"0",
	"n",
	"go",
	':silent w<bar>lua require("auto-pandoc").run_pandoc()<cr>',
	{ noremap = true, silent = true }
)
