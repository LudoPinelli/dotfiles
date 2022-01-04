require("ludo.plugConfig.toggleterm.custom_terms")
require("ludo.plugConfig.telescope.custom_pickers")

local wk = require("which-key")
wk.register({
	["<Leader>"] = {
		["a"] = { "<Cmd>Alpha<CR>", "䀘  Landing page" },
		["c"] = { "<Cmd>BufferClose<CR>", "   Close Buffer" },
		["e"] = { "<Cmd>lua require('ludo.plugConfig.barbar.tree').toggle()<CR>", "פּ   Explorer" },
		["h"] = { "<Cmd>nohlsearch<CR>", "   No Highlight" },
		["?"] = { ":<C-U>Cheatsheet<CR>", "  Cheat Sheets" },
		["z"] = { "<Cmd>set spell!<CR>", "暈   Toggle Spellcheck" },
		["W"] = { "<Cmd>cd %:p:h<CR>:pwd<CR>", "   Set Working Directory" },
		["C"] = { "<Cmd>lua nvim_config()<CR>", "  Config Files" },
		["n"] = { "<Cmd>Telescope neoclip<CR>", "Clipboard" },
		["i"] = { "`.", "Back to last insert" },
		["p"] = { "<Cmd>BufferPick<CR>", "Pick a buffer" },

		g = {
			name = "   Git",

			g = { "<Cmd>lua lazygit_toggle()<CR>", "  LazyGit" },
			j = { "<Cmd>lua require('gitsigns').next_hunk()<CR>", "Next Hunk" },
			k = { "<Cmd>lua require('gitsigns').prev_hunk()<CR>", "Prev Hunk" },
			p = { "<Cmd>lua require('gitsigns').preview_hunk()<CR>", "Preview Hunk" },
			r = { "<Cmd>lua require('gitsigns').reset_hunk()<CR>", "Reset Hunk" },
			R = { "<Cmd>lua require('gitsigns').reset_buffer()<CR>", "Reset Buffer" },
			s = { "<Cmd>lua require('gitsigns').stage_hunk()<CR>", "Stage Hunk" },
			u = { "<Cmd>lua require('gitsigns').undo_stage_hunk()<CR>", "Undo Stage Hunk" },
			l = { "<Cmd>lua require('gitsigns').blame_line{full=true}<CR>", "Blame line" },
			o = { "<Cmd>Telescope git_status<CR>", "Open changed file" },
			b = { "<Cmd>Telescope git_branches<CR>", "  Checkout branch" },
			c = { "<Cmd>Telescope git_commits<CR>", "  Checkout commit" },
			f = { "<Cmd>Telescope git_files<CR>", "Git files" },
			d = { "<Cmd><CR>", "  Diff" },
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
			s = { "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", "  Document Symbols" },
			S = { "<Cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "  Workspace Symbols" },
			R = { "<Cmd>lua vim.lsp.buf.references()<CR>", "Ref. of word under cursor" },
			t = { "<Cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
		},

		s = {
			name = "   Search",
			h = { "<Cmd>Telescope help_tags<CR>", "  Help" },
			f = { "<Cmd>Telescope find_files<CR>", "  Files" },
			t = { "<Cmd>Telescope live_grep<CR>", "  Text" },
			M = { "<Cmd>Telescope man_pages<CR>", "  Man Pages" },
			r = { "<Cmd>Telescope oldfiles<CR>", "  Open Recent File" },
			R = { "<Cmd>Telescope registers<CR>", "  Registers" },
			k = { "<Cmd>Telescope keymaps<CR>", "  Keymaps" },
			c = { "<Cmd>Telescope commands<CR>", "  Commands" },
			i = { "<Cmd>Telescope command_history<CR>", "  Commands History" },
			m = { "<Cmd>Telescope notify<CR>", "  Messages History" },
			C = { ":<C-U>Cheatsheet<CR>", "  Cheat Sheets" },
			H = { "<Cmd>lua home()<CR>", "  Home Directory" },
			b = { "<Cmd>Telescope buffers<CR>", "  Buffers" },
		},

		t = {
			name = "   Terminal",
			f = { "<Cmd>ToggleTerm direction=float<CR>", "  Float" },
			h = { "<Cmd>ToggleTerm size=10 direction=horizontal<CR>", "  Horizontal" },
			v = { "<Cmd>ToggleTerm size=80 direction=vertical<CR>", "   Vertical" },
			g = { "<Cmd>lua lazygit_toggle()<CR>", "  LazyGit" },
			G = { "<Cmd>lua gitui_toggle()<CR>", "  GitUI" },
			p = { "<Cmd>lua python_toggle()<CR>", "   Python" },
			n = { "<Cmd>lua node_toggle()<CR>", "  Node.js" },
			t = { "<Cmd>lua htop_toggle()<CR>", "   Htop" },
			w = { "<Cmd>lua cargo_watch_toggle()<CR>", "   Cargo Watch" },
		},

		x = {
			name = "   Lists",
			w = { "<Cmd>Trouble workspace_diagnostics<CR>", "Workspace Diagnostics" },
			d = { "<Cmd>Trouble document_diagnostics<CR>", "Document Diagnostics" },
			l = { "<Cmd>Trouble loclist<CR>", "Loclist" },
			q = { "<Cmd>Trouble quickfix<CR>", "Quickfix List" },
			r = { "<Cmd>Trouble lsp_references<CR>", "Ref. of word under cursor" },
		},
	},
})

local Utils = require("ludo.plugConfig.which-key.keymaputils")

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

-- Better Visual mode indent
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Move line up/down
xnoremap("<A-Down>", ":move '>+1<CR>gv-gv")
xnoremap("<A-Up>", ":move '>-2<CR>gv-gv")

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