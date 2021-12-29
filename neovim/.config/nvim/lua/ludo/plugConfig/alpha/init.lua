local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	"       :.             :.      ",
	"     :---:            -=-.    ",
	"   :------:           -===-.  ",
	" :-====-----.         -=====-.",
	":---====-----:        ========",
	":----===------:       =++++++=",
	":-----==--------.     =++++++=",
	"--------:--------:    =+++++++",
	"-------- .--------:   =+++++++",
	"--------   ---------. =+++++++",
	"--------    :=======-.=+++++++",
	"--------     :========++++++++",
	"-======-      .-=======+++++++",
	"-======-        -=====++++++++",
	":======-         :====+++++*+-",
	"  :====-          .===+++++-  ",
	"    :==-            -=+++-    ",
	"      :-             :+-      ",
}

dashboard.section.buttons.val = {
	-- dashboard.button("n", "  New File           ", ":ene <BAR> startinsert<CR>"),
	dashboard.button("e", "פּ  Explore            ", ":NvimTreeToggle<CR>"),
	dashboard.button("f", "  Find File          ", ":Telescope find_files<CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find Text          ", ":Telescope live_grep<CR>"),
	dashboard.button("C", "  Config Files       ", "<Cmd>lua require'ludo.plugConfig.telescope'.nvim_config()<CR>"),
	-- dashboard.button("S", "  Cheat Sheets       ", "<Cmd>lua require'ludo.plugConfig.telescope'.cheat_sheet()<CR>"),
	dashboard.button("q", "  Quit               ", ":qa<CR>"),
}

local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune()

dashboard.opts.opts.noautocmd = true

-- Send config to alpha
alpha.setup(dashboard.opts)
