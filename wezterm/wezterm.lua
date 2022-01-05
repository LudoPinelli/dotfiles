local wezterm = require("wezterm")
return {
	-- Windows only
	default_prog = { "wsl.exe", "--cd", "~" },

	font = wezterm.font("Monofur NF"),
	-- font = wezterm.font("Iosevka"),
	font_size = 15,
	initial_cols = 120,
	initial_rows = 40,
	hide_tab_bar_if_only_one_tab = true,

	-- color_scheme = "nord",
	-- Catppuccin
	colors = {
		background = "#1E1E29",
		foreground = "#D7DAE0",
		selection_bg = "#2D293B",
		selection_fg = "#F0AFE1",
		cursor_bg = "#B3E1A3",
		cursor_fg = "#EADDA0",
		cursor_border = "#B3E1A3",

		scrollbar_thumb = "#B3E1A3",

		split = "#B3E1A3",

		ansi = { "#6E6C7C", "#E28C8C", "#B3E1A3", "#EADDA0", "#A4B9EF", "#C6AAE8", "#F0AFE1", "#D7DAE0" },
		brights = { "#6E6C7C", "#E28C8C", "#B3E1A3", "#EADDA0", "#A4B9EF", "#C6AAE8", "#F0AFE1", "#D7DAE0" },

		tab_bar = {
			background = "#15121C",
			active_tab = {
				bg_color = "#1E1E28",
				fg_color = "#D7DAE0",
			},
			inactive_tab = {
				bg_color = "#1B1923",
				fg_color = "#A4B9EF",
			},
			inactive_tab_hover = {
				bg_color = "#1E1E28",
				fg_color = "#D7DAE0",
			},
			new_tab = {
				bg_color = "#15121C",
				fg_color = "#6E6C7C",
			},
			new_tab_hover = {
				bg_color = "#1E1E28",
				fg_color = "#D7DAE0",
				italic = true,
			},
		},
	},
	-- Kaganawa theme
	-- colors = {
	--   foreground = "#dcd7ba",
	--   background = "#1f1f28",
	--
	--   cursor_bg = "#c8c093",
	--   cursor_fg = "#c8c093",
	--   cursor_border = "#c8c093",
	--
	--   selection_fg = "#c8c093",
	--   selection_bg = "#2d4f67",
	--
	--   scrollbar_thumb = "#16161d",
	--   split = "#16161d",
	--
	--   ansi = {"#090618", "#c34043", "#76946a", "#c0a36e", "#7e9cd8", "#957fb8", "#6a9589", "#c8c093"},
	--   brights = {"#727169", "#e82424", "#98bb6c", "#e6c384", "#7fb4ca", "#938aa9", "#7aa89f", "#dcd7ba"},
	--   indexed = {[16] = "#ffa066", [17] = "#ff5d62"}
	-- }
}
