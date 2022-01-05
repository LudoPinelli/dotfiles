local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	"       :.             :.",
	"     :---:            -=-.",
	"   :------:           -===-.",
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
	"  :====-          .===+++++-",
	"    :==-            -=+++-",
	"      :-             :+-",
}

require("plugConfig.telescope.custom_pickers")

dashboard.section.buttons.val = {
	-- dashboard.button("n", "  New File           ", ":ene <BAR> startinsert<CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("h", "  Home directory     ", "<Cmd>lua home()<CR>"),
	dashboard.button("e", "פּ  Explore            ", "<Cmd>lua require('lir.float').toggle()<CR>"),
	dashboard.button("f", "  Find File          ", ":Telescope find_files<CR>"),
	dashboard.button("t", "  Find Text          ", ":Telescope live_grep<CR>"),
	dashboard.button("c", "  Config Files       ", "<Cmd>lua nvim_config()<CR>"),
	dashboard.button("q", "  Quit               ", ":qa<CR>"),
}

dashboard.section.footer.val = "🙙 ⎯ 🙛 "

dashboard.opts.opts.noautocmd = true

-- Send config to alpha
alpha.setup(dashboard.opts)
