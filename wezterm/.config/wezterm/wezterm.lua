local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.bold_brightens_ansi_colors = "No"
-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font("CommitMono")
config.font_size = 13

-- config.window_padding = {
-- 	left = 10,
-- 	right = 10,
-- 	top = 10,
-- 	bottom = 10,
-- }

-- Colorscheme
-- config.color_scheme = "nightfox"
-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "kanagawa (Gogh)"

config.enable_tab_bar = true
config.window_decorations = "NONE"
config.window_background_opacity = 0.85

config.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "h",
		mods = "SUPER",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

-- Tab bar
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = true
config.status_update_interval = 1000
config.hide_tab_bar_if_only_one_tab = true

wezterm.on("update-status", function(window, pane)
	local time = wezterm.strftime("%H:%M")

	local basename = function(s)
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end

	local cmd = basename(pane:get_foreground_process_name()) or ""

	window:set_right_status(wezterm.format({
		{ Foreground = { Color = "#719cd6" } },
		{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
		"ResetAttributes",
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
		{ Text = "  " },
	}))
end)

return config
