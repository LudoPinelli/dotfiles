local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.bold_brightens_ansi_colors = "No"
-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font("CommitMono")
config.font_size = 13

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

-- Colorscheme
config.color_scheme = "nightfox"
-- config.color_scheme = "Catppuccin Mocha"

config.enable_tab_bar = false
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

return config
