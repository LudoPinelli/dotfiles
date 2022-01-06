require("plugConfig.toggleterm.custom_terms")
require("plugConfig.telescope.custom_pickers")

local wk = require("which-key")
wk.register({
	["<Leader>"] = {
		["a"] = { "<Cmd>Alpha<CR>", "䀘 Landing page" },
		["c"] = { "<Cmd>BufferClose<CR>", "  Close Buffer" },
		["e"] = { "<Cmd>lua require('lir.float').toggle()<CR>", "פּ  Explorer" },
		["h"] = { "<Cmd>nohlsearch<CR>", "  No Highlight" },
		["?"] = { ":<C-U>Cheatsheet<CR>", "  Cheat Sheets" },
		["z"] = { "<Cmd>set spell!<CR>", "暈 Toggle Spellcheck" },
		["W"] = { "<Cmd>cd %:p:h<CR>:pwd<CR>", "  Set Working Directory" },
		["C"] = { "<Cmd>lua nvim_config()<CR>", "  Config Files" },
		["n"] = { "<Cmd>Telescope neoclip<CR>", "  Clipboard" },
		["i"] = { "`.", "  Back to last insert" },
		["p"] = { "<Cmd>BufferPick<CR>", "  Pick a buffer" },

		g = {
			name = "   Git",

			b = { "<Cmd>Telescope git_branches<CR>", "  Branches" },
			c = { "<Cmd>Telescope git_commits<CR>", "  Commits" },
			g = { "<Cmd>lua lazygit_toggle()<CR>", "  LazyGit" },
			f = { "<Cmd>Telescope git_files<CR>", "Git files" },
			j = { "<Cmd>lua require('gitsigns').next_hunk()<CR>", "Next Hunk" },
			k = { "<Cmd>lua require('gitsigns').prev_hunk()<CR>", "Prev Hunk" },
			l = { "<Cmd>lua require('gitsigns').blame_line{full=true}<CR>", "Blame line" },
			o = { "<Cmd>Telescope git_status<CR>", "  Open changed file" },
			p = { "<Cmd>lua require('gitsigns').preview_hunk()<CR>", "Preview Hunk" },
			r = { "<Cmd>lua require('gitsigns').reset_hunk()<CR>", "Reset Hunk" },
			R = { "<Cmd>lua require('gitsigns').reset_buffer()<CR>", "Reset Buffer" },
			s = { "<Cmd>lua require('gitsigns').stage_hunk()<CR>", "Stage Hunk" },
			u = { "<Cmd>lua require('gitsigns').undo_stage_hunk()<CR>", "Undo Stage Hunk" },
		},

		l = {
			name = "   LSP",

			a = { "<Cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
			d = { "<Cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostics in float window" },
			D = { "<Cmd>Telescop diagnostics<CR>", "Diagnostics in Telescope" },
			f = { "<Cmd>lua vim.lsp.buf.formatting()<CR>", "  Format" },
			i = { "<Cmd>LspInfo<CR>", "  Info" },
			l = { "<Cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
			L = { "<Cmd>lua vim.diagnostic.setloclist()<CR>", "Location list" },
			q = { "<Cmd>lua vim.diagnostic.setqflist()<CR>", "Send to Quickfix List" },
			r = { "<Cmd>lua vim.lsp.buf.rename()<CR>", "凜  Rename" },
			R = { "<Cmd>lua vim.lsp.buf.references()<CR>", "Ref. of word under cursor" },
			s = { "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", "  Document Symbols" },
			S = { "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "  Workspace Symbols" },
			t = { "<Cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
		},

		s = {
			name = "   Search",

			b = { "<Cmd>Telescope buffers<CR>", "  Buffers" },
			c = { "<Cmd>Cheat<CR>", "  on Cheat.sh" },
			C = { "<Cmd>Telescope commands<CR>", "  Commands" },
			f = { "<Cmd>Telescope find_files<CR>", "  Files" },
			h = { "<Cmd>Telescope help_tags<CR>", "  Help" },
			H = { "<Cmd>lua home()<CR>", "  Home Directory" },
			i = { "<Cmd>Telescope command_history<CR>", "  Commands History" },
			k = { "<Cmd>Telescope keymaps<CR>", "  Keymaps" },
			M = { "<Cmd>Telescope man_pages<CR>", "  Man Pages" },
			o = {
				[[
        <Cmd>lua require("telescope").extensions.repo.cached_list{file_ignore_patterns={"/%.cache", "/%.cargo", "/%.local", "/%.nvm", "/ludov"}}<CR>
        ]],
				"  Repo",
			},
			r = { "<Cmd>Telescope oldfiles<CR>", "  Open Recent File" },
			R = { "<Cmd>Telescope registers<CR>", "  Registers" },
			t = { "<Cmd>Telescope live_grep<CR>", "  Text" },
		},

		t = {
			name = "   Terminal",

			f = { "<Cmd>ToggleTerm direction=float<CR>", "  Float" },
			g = { "<Cmd>lua lazygit_toggle()<CR>", "  LazyGit" },
			h = { "<Cmd>ToggleTerm size=10 direction=horizontal<CR>", "  Horizontal" },
			n = { "<Cmd>lua node_toggle()<CR>", "  Node.js" },
			p = { "<Cmd>lua python_toggle()<CR>", "   Python" },
			t = { "<Cmd>lua htop_toggle()<CR>", "   Htop" },
			v = { "<Cmd>ToggleTerm size=80 direction=vertical<CR>", "   Vertical" },
			w = { "<Cmd>lua cargo_watch_toggle()<CR>", "   Cargo Watch" },
		},

		x = {
			name = "   Lists",

			d = { "<Cmd>Trouble document_diagnostics<CR>", "Document Diagnostics" },
			l = { "<Cmd>Trouble loclist<CR>", "Loclist" },
			q = { "<Cmd>Trouble quickfix<CR>", "Quickfix List" },
			r = { "<Cmd>Trouble lsp_references<CR>", "Ref. of word under cursor" },
			w = { "<Cmd>Trouble workspace_diagnostics<CR>", "Workspace Diagnostics" },
		},
	},
})

local Utils = require("plugConfig.which-key.keymaputils")

-- local exprnnoremap = Utils.expnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
-- local tnoremap = Utils.tnoremap
-- local nmap = Utils.nmap

-- mapleader
-- nnoremap("<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.localleader = " "

-- jk to normal mode
inoremap("jk", "<Esc>")

-- copy to the end of the line
nnoremap("Y", "y$")

-- keep the cursor cenetered
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")

-- Undo break points
inoremap(",", ",<C-g>u")
inoremap(".", ".<C-g>u")
inoremap("[", "[<C-g>u")
inoremap("!", "!<C-g>u")
inoremap("?", "?<C-g>u")

-- Better Visual mode indent
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Move line up/down
xnoremap("<A-Down>", ":move '>+1<CR>gv=gv")
xnoremap("<A-Up>", ":move '<-2<CR>gv=gv")

nnoremap("<A-Down>", ":m .+1<CR>==")
nnoremap("<A-Up>", ":m .-2<CR>==")

inoremap("<A-Down>", "<Esc>:m .+1<CR>==gi")
inoremap("<A-Up>", "<Esc>:m .-2<CR>==gi")

-- Move between windows
nnoremap("<C-k>", "<C-w><Up>")
nnoremap("<C-j>", "<C-w><Down>")
nnoremap("<C-h>", "<C-w><Left>")
nnoremap("<C-l>", "<C-w><Right>")

-- ctrl+s to save
nnoremap("<C-s>", ":w<CR>")
inoremap("<C-s>", "<Esc>:w<CR>i")

-- switch to normal mode in terminal
nnoremap("<Esc>", "<C-\\><C-n>")

-- Barbar
nnoremap("<Tab>", ":BufferNext<CR>")
nnoremap("<S-Tab>", ":BufferPrevious<CR>")

-- nnoremap("K", ":lua show_documentation()<Cr>")
-- function show_documentation()
-- 	local filetype = vim.bo.filetype
-- 	if vim.tbl_contains({ "vim", "help" }, filetype) then
-- 		vim.cmd("h " .. vim.fn.expand("<cword>"))
-- 	elseif vim.tbl_contains({ "man" }, filetype) then
-- 		vim.cmd("Man " .. vim.fn.expand("<cword>"))
-- 	elseif vim.fn.expand("%:t") == "Cargo.toml" then
-- 		require("crates").show_popup()
-- 	else
-- 		vim.lsp.buf.hover()
-- 	end
-- end
