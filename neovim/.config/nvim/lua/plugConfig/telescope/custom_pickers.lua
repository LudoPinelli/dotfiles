-- Browser in .dotfiles/
function get_path()
	if jit.os == "Windows" then
		return "$LOCALAPPDATA/nvim/"
	else
		return "~/.dotfiles/neovim/.config/nvim/"
	end
end

function nvim_config()
	local path = get_path()
	require("telescope").extensions.file_browser.file_browser({
		prompt_title = " Neovim Configuration",
		initial_mode = "normal",
		prompt_position = "top",
		path = path,
		cwd = path,
		depth = 1,
		sorting_strategy = "ascending",
	})
end

-- Find files in home directory
function get_home()
	if jit.os == "Windows" then
		return "$USERPROFILE/OneDrive/Documents/"
	else
		return "~/"
	end
end

function home()
	local path = get_home()
	require("telescope.builtin").find_files({
		prompt_title = "  Home Directory",
		prompt_position = "top",
		cwd = path,
		hidden = false,
	})
end
