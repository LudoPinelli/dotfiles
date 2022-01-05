-- Browser in .dotfiles/
function nvim_config()
	require("telescope").extensions.file_browser.file_browser({
		prompt_title = " Neovim Configuration",
		prompt_position = "top",
		path = "~/.dotfiles/neovim/.config/nvim/",
		cwd = "~/.dotfiles/neovim/.config/nvim/",
		depth = 5,
		sorting_strategy = "ascending",
	})
end

-- Find files in home directory
function home()
	require("telescope.builtin").find_files({
		prompt_title = "  Home Directory",
		prompt_position = "top",
		cwd = "~/",
		hidden = false,
	})
end
