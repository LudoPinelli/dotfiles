-- Browser in .dotfiles/
function get_path()
	if jit.os == "Windows" then
		return "$LOCALAPPDATA/nvim/"
	else
		return "~/.config/nvim/"
	end
end

function nvim_config()
	local path = get_path()
	require("telescope").extensions.file_browser.file_browser({
		prompt_title = " Neovim Configuration",
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
		cwd = path,
		hidden = false,
		search_dirs = { ".config", ".dotfiles", ".local", "bin", "dev", "Documents" },
	})
end
