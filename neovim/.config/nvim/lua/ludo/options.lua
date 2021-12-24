local o = vim.opt

-- Visual
o.showtabline     = 2 	                -- Always Show Tabline
o.pumheight       = 10                  -- Pop up Menu Height
o.number          = true 	              -- Display Line Number
o.relativenumber  = true 	              -- Make line numbers relative
o.termguicolors   = true	              -- Set Terminal Colors
o.title           = true                -- Display File Info on Title
o.showmode        = false	              -- Don't Show MODES
o.cursorline      = true                -- Highlight the actual line
o.signcolumn      = 'yes'	              -- Sign Column

-- Search
o.hlsearch        = true 	              -- Set highlight on search
o.ignorecase      = true 	              -- Case insensitive searching
o.smartcase       = true	              -- If Upper Case Char => case sensitive search

-- Tabs
o.smarttab       = true	                -- Smart Tabs
o.smartindent     = true 	              -- Smart Indenting
o.expandtab       = true                -- change tabs to space
o.tabstop         = 2	                  -- Tabstop
o.softtabstop     = 2
o.shiftwidth      = 2

-- Splits
o.splitbelow      = true 	              -- Force Split Below
o.splitright      = true 	              -- Force Split Right

-- Scroll Offset
o.scrolloff       = 12  	              -- Vertical Scroll Offset
o.sidescrolloff   = 8  	                -- Horizontal Scroll Offset

-- Mouse
o.mouse           = 'a'	                -- Enable mouse mode

-- System
o.clipboard       = "unnamedplus"
o.hidden          = true	              -- Do not save when switching buffers
o.breakindent     = true	              -- Enable break indent
o.backup          = false	              -- Disable Backup
o.swapfile        = false	              -- Don't create Swap Files
o.spell           = false               -- No spellcheck
o.undofile        = true 	              -- Save undo history
o.updatetime      = 250	                -- Decrease update time
o.timeoutlen      = 250	                -- Time for mapped sequence to complete (in ms)
o.inccommand      = 'split'             -- Incremental live completion
o.fileencoding    = "utf-8"	            -- Set File Encoding
o.spelllang       = {"en", "fr"}
o.completeopt     = "menuone,noselect"  -- Autocompletion
o.shortmess:append { W = true, a = true }
o.undodir         = vim.fn.stdpath("cache") .. "/undodir"
-- vim.cmd "filetype indent plugin on"

-- Highlight on yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)

o.wildignore = [[
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
