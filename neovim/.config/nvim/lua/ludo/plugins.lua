local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Sync plugins on write/save
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call, so no error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim") -- Packer

	-- Theme
	use("EdenEast/nightfox.nvim") -- Nord theme

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		requires = { -- Completion plugin
			use("hrsh7th/cmp-buffer"), -- buffer completion
			use("hrsh7th/cmp-nvim-lsp"), -- Lsp completion
			use("hrsh7th/cmp-path"), -- path completion
			use("hrsh7th/cmp-cmdline"), -- cmdline completion
			use("saadparwaiz1/cmp_luasnip"), -- snippet completion
			use("hrsh7th/cmp-nvim-lua"), -- neovim lua completion
			use("ray-x/cmp-treesitter"), -- treesitter completion
		},
	})

	-- Snippets
	use({
		"L3MON4D3/luaSnip", -- Snippet engine
		requires = {
			"rafamadriz/friendly-snippets", -- Snippets collection
		},
	})

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/nvim-lsp-installer", -- Language server installer
			"tami5/lspsaga.nvim", -- better UI
			"jose-elias-alvarez/null-ls.nvim", -- formatter and more
		},
	})

	use("windwp/nvim-autopairs") -- Autopairs

	-- Rust specific
	use({
		"simrat39/rust-tools.nvim", -- Additional tools for Rust
		requires = {
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
		},
	})
	use({
		"saecki/crates.nvim",
		config = function()
			require("crates").setup()
		end,
	})

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"nvim-telescope/telescope-fzf-native.nvim", -- fzf support for telescope
		},
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/playground",
		},
		run = ":TSUpdate",
	})

	-- Explorer
	use({
		"kyazdani42/nvim-tree.lua",
		require = {
			"kyazdani42/nvim-web-devicons",
		},
	})

	-- Status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	})

	-- Commenting
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Pretty lists (quickfix, lsp_references, document_diagnostics, workspace_diagnostics,
	--               lsp_definitions, lsp_type_definitions, loclist)
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})

	-- Terminal utility
	use("akinsho/nvim-toggleterm.lua")

	-- Improve startup time
	use("lewis6991/impatient.nvim")

	-- Stabilize windows on open/close
	use({
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	})

	-- Add indentation guides
	use("lukas-reineke/indent-blankline.nvim")

	-- Dashboard
	use({
		"goolord/alpha-nvim",
		requires = { "BlakeJC94/alpha-nvim-fortune" },
	})

	-- Tabline
	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	-- To see key mappings
	use("folke/which-key.nvim")

	-- Markdown Previewer
	use("ellisonleao/glow.nvim")

	-- Surround
	use("blackCauldron7/surround.nvim")

	-- Clipboard utility
	use({
		"AckslD/nvim-neoclip.lua",
		requires = {
			"nvim-telescope/telescope.nvim",
		},
	})

	-- Git integration
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({
		"sindrets/diffview.nvim",
		require = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({
		"TimUntersberger/neogit",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("neogit").setup()
		end,
	})

	-- Notifications
	use("rcarriga/nvim-notify")

	-- Enhanced vim.selct and vim.input
	use("stevearc/dressing.nvim")

	-- Dim inactive windows
	use("sunjon/shade.nvim")

	-- Automatically set up config after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
