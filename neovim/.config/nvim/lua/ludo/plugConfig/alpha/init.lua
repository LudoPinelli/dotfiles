local alpha = require("alpha")

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
  dashboard.button("e", "  New File           ", ":ene <BAR> startinsert<CR>"),
  dashboard.button("f", "  Find File          ", ":Telescope find_files<CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find Text          ", ":Telescope live_grep<CR>"),
  dashboard.button("c", "  NVIM Config        ", ":Telescope dotfiles<CR>"),
  dashboard.button("q", "  Quit               ", ":qa<CR>"),
}

local fortune = require("alpha.fortune")
dashboard.section.footer.val = fortune()

dashboard.opts.opts.noautocmd = true

-- Send config to alpha
alpha.setup(dashboard.opts)
