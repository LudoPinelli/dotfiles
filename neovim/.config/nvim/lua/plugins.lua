local fn = vim.fn

-- Automatically install packer if it's not already
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

-- Sync plugins on write/save of this file
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
	----------------------------------------- PLUGINS -------------------------------------------

	-- Packer itself
	use("wbthomason/packer.nvim")

	------------------------------------
	--             CORE               --
	------------------------------------

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-telescope/telescope-file-browser.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
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

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/nvim-lsp-installer",
			"jose-elias-alvarez/null-ls.nvim",
		},
	})
	use("ray-x/lsp_signature.nvim")
	use("kosayoda/nvim-lightbulb")

	-- Completion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			use("hrsh7th/cmp-buffer"),
			use("hrsh7th/cmp-nvim-lsp"),
			use("hrsh7th/cmp-path"),
			use("hrsh7th/cmp-cmdline"),
			use("saadparwaiz1/cmp_luasnip"),
			use("hrsh7th/cmp-nvim-lua"),
			use("ray-x/cmp-treesitter"),
			use("f3fora/cmp-spell"),
		},
	})

	-- Snippets
	use({
		"L3MON4D3/luaSnip",
		requires = {
			"rafamadriz/friendly-snippets",
		},
	})

	------------------------------------
	--            VISUAL              --
	------------------------------------

	-- Themes
	use("EdenEast/nightfox.nvim")
	use("rebelot/kanagawa.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- use("sunjon/shade.nvim") -- Dim inactive windows
	use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides
	use("rcarriga/nvim-notify") -- Notifications
	use("nvim-lualine/lualine.nvim") -- Status line
	use("goolord/alpha-nvim") -- Dashboard
	use({ -- Stabilize windows on open/close
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	})
	use({ -- colorize color codes
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
	------------------------------------
	--         PRODUCTIVITY           --
	------------------------------------

	use("windwp/nvim-autopairs") -- Autopairs
	use("tpope/vim-surround") -- Surround
	use({ "zeertzjq/which-key.nvim", branch = "patch-1" }) -- Key mappings easy access
	use("romgrk/barbar.nvim") -- Tabline
	use("folke/trouble.nvim") -- Nice lists
	use({ -- Commenting
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({ -- Smooth "jk" experience for escaping from insert mode
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	})

	------------------------------------
	--             GIT                --
	------------------------------------

	use({
		"lewis6991/gitsigns.nvim", -- Add signs in the gutter/allox hunks manipulation
		config = function()
			require("gitsigns").setup()
		end,
	})
	use("cljoly/telescope-repo.nvim") -- Allow switching to any repo via telescope

	-----------------------------------
	--         UTILITIES             --
	-----------------------------------

	-- Explorer
	use("tamago324/lir.nvim")
	use("tamago324/lir-bookmark.nvim")
	use("tamago324/lir-git-status.nvim")

	use("AckslD/nvim-neoclip.lua") -- Clipboard utility
	use("akinsho/nvim-toggleterm.lua") -- Terminal utility
	use("lewis6991/impatient.nvim") -- Improve startup time
	use("sudormrfbin/cheatsheet.nvim") -- Searchable CheetSheat
	use("RishabhRD/nvim-cheat.sh") -- Access to Cheat.sh
	use("dstein64/vim-startuptime") -- Startup time info

	------------------------------------
	--          MARKDOWN              --
	------------------------------------

	use("ellisonleao/glow.nvim") -- Markdown Previewer
	use({ -- Easy conversion of MD with pandoc
		"jghauser/auto-pandoc.nvim",
		config = function()
			require("auto-pandoc")
		end,
	})

	------------------------------------
	--         PROGRAMMING            --
	------------------------------------

	-- Debugging
	use("mfussenegger/nvim-dap")
	use("Pocco81/DAPInstall.nvim")

	-- Rust
	use("simrat39/rust-tools.nvim")
	use({
		"saecki/crates.nvim",
		config = function()
			require("crates").setup()
		end,
	})

	------------------------------------
	--          REQUIRED              --
	------------------------------------

	-- By: rust-tools, gitsigns, cheetsheat, telescope
	-- auto-pandoc, lir
	use("nvim-lua/plenary.nvim")
	-- By: barbar, lualine, telescope, lir
	use("kyazdani42/nvim-web-devicons")
	-- By: popup
	use("nvim-lua/popup.nvim")
	-- By: nvim-cheat.sh
	use("RishabhRD/popfix")

	--------------------------------------------------------------

	-- Automatically set up config after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
