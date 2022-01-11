local opt = vim.opt

-- Visual
opt.showtabline = 2 -- Always Show Tabline
opt.pumheight = 10 -- Pop up Menu Height
opt.number = true -- Display Line Number
opt.relativenumber = true -- Make line numbers relative
opt.termguicolors = true -- Set Terminal Colors
opt.title = true -- Display File Info on Title
opt.showmode = false -- Don't Show MODES
opt.cursorline = true -- Highlight the actual line
opt.signcolumn = "yes" -- Sign Column
-- vim.cmd("syntax on")
opt.guifont = "Monofur NF:15"

-- formatting
opt.formatoptions = opt.formatoptions
	- "a" -- no autoformatting
	- "t" -- no code formatting, linters are in charge
	+ "c" -- comment respect textwidth
	+ "q" -- allow formatting comments with gq
	- "o" -- o and O don't continue comments
	+ "r" -- but do continue when pressing enter
	+ "n" -- indent past the formatlistpat, not underneath it
	- "2" -- don't replace two spaces with one
opt.joinspaces = false

-- Search
opt.incsearch = true -- incremental search
opt.hlsearch = true -- Set highlight on search
opt.ignorecase = true -- Case insensitive searching
opt.smartcase = true -- If Upper Case Char => case sensitive search

-- Tabs
opt.smarttab = true -- Smart Tabs
opt.smartindent = true -- Smart Indenting
opt.expandtab = true -- change tabs to space
opt.tabstop = 2 -- Tabstop
opt.softtabstop = 2 -- number of spaces a <Tab> counts for
opt.shiftwidth = 2 -- number of spaces to use for each step o (auto)indent.
opt.autoindent = true -- copy indent from current line when starting a new line

-- lines
opt.wrap = true -- wrap long lines
opt.breakindent = true -- wrapped lines continue visually indented
opt.showbreak = string.rep(" ", 3) -- what is at the start of lines that have been wrapped
opt.linebreak = true -- long lines will wrap on a character define in breakat
opt.breakat = " ^I!@*-+;:,./?"

-- Splits
opt.splitbelow = true -- Force Split Below
opt.splitright = true -- Force Split Right

-- Scroll Offset
opt.scrolloff = 12 -- Vertical Scroll Offset
opt.sidescrolloff = 8 -- Horizontal Scroll Offset

-- folding defined in treesitter.lua

-- Mouse
opt.mouse = "a" -- Enable mouse mode

-- System
opt.belloff = "all" -- no bell
-- opt.clipboard = "unnamedplus" -- always use clipboard
opt.shada = { "!", "'1000", "<50", "s10", "h" } -- what is saved between two sessions
opt.hidden = true -- Do not save when switching buffers
opt.backup = false -- Disable Backup
opt.swapfile = false -- Don't create Swap Files
opt.undofile = true -- Save undo history
opt.updatetime = 250 -- Decrease update time
opt.timeoutlen = 250 -- Time for mapped sequence to complete (in ms)
opt.inccommand = "split" -- Incremental live completion
opt.fileencoding = "utf-8" -- Set File Encoding
opt.spelllang = { "en", "fr" }
opt.spell = false -- spellcheck
opt.completeopt = "menuone,noselect" -- Autocompletion
opt.shortmess:append({ W = true, a = true }) -- what hit-enter prompt to avoid
opt.undodir = vim.fn.stdpath("cache") .. "/undodir"
vim.g.loaded_netrwPlugin = true

opt.wildignore = [[
.git,.hg,.svn
*.aux,*.out,*.toc
*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
*.ai,*.psd
*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
*.mp3,*.oga,*.ogg,*.wav,*.flac
*.eot,*.otf,*.ttf,*.woff
*.doc,*.pdf,*.cbr,*.cbz
*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
*.swp,.lock,.DS_Store,._*
*/tmp/*,*.so,*.swp,*.zip,**/target/**"
]]
