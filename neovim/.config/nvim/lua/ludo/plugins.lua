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

	use({ -- Telescope
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-telescope/telescope-file-browser.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
	})
	use({ -- Treesitter
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/nvim-treesitter-refactor",
			"nvim-treesitter/playground",
		},
		run = ":TSUpdate",
	})
	use({ -- LSP
		"neovim/nvim-lspconfig",
		requires = {
			"williamboman/nvim-lsp-installer",
			"jose-elias-alvarez/null-ls.nvim",
		},
	})
	use({ -- Completion
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
	use({ -- Snippets
		"L3MON4D3/luaSnip",
		requires = {
			"rafamadriz/friendly-snippets",
		},
	})
	use({
		"tzachar/cmp-tabnine",
		run = "~/install.sh",
		requires = "hrsh7th/nvim-cmp",
	})

	------------------------------------
	--            VISUAL              --
	------------------------------------

	use("EdenEast/nightfox.nvim") -- Theme
	use("sunjon/shade.nvim") -- Dim inactive windows
	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use("lukas-reineke/indent-blankline.nvim") -- Add indentation guides
	use("rcarriga/nvim-notify") -- Notifications
	use("nvim-lualine/lualine.nvim") -- Status line
	use("goolord/alpha-nvim") -- Dashboard
	-- use("yamatsum/nvim-cursorline") -- highlight line and current word
	use({ -- Stabilize windows on open/close
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	})

	------------------------------------
	--         PRODUCTIVITY           --
	------------------------------------

	use("windwp/nvim-autopairs") -- Autopairs
	use("tpope/vim-surround") -- Surround
	use("folke/which-key.nvim") -- Key mappings easy access
	use("romgrk/barbar.nvim") -- Tabline
	use("sudormrfbin/cheatsheet.nvim") -- Searchable CheetSheat
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

	use("sindrets/diffview.nvim")
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	-----------------------------------
	--         UTILITIES             --
	-----------------------------------

	use("AckslD/nvim-neoclip.lua") -- Clipboard utility
	use("kyazdani42/nvim-tree.lua") -- Explorer
	use("akinsho/nvim-toggleterm.lua") -- Terminal utility
	use("lewis6991/impatient.nvim") -- Improve startup time

	------------------------------------
	--          MARKDOWN              --
	------------------------------------

	use("ellisonleao/glow.nvim") -- Markdown Previewer
	use({ -- Esay conversion of MD with pandoc
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

	-- By: rust-tools, diffview, gitsigns, cheetsheat, telescope
	-- auto-pandoc
	use("nvim-lua/plenary.nvim")
	-- By: nvim-tree, barbar, lualine, telescope
	use("kyazdani42/nvim-web-devicons")
	-- By: popup
	use("nvim-lua/popup.nvim")

	--------------------------------------------------------------

	-- Automatically set up config after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
