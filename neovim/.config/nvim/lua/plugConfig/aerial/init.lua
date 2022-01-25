require("aerial").setup({
	on_attach = function(bufnr)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>a", "<Cmd>AerialToggle<CR>", {})
	end,
})
