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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
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
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("numToStr/Comment.nvim") -- Easily comment stuff

	use("karb94/neoscroll.nvim")

	-- colorschemes
	use("folke/tokyonight.nvim")
	use("rmehri01/onenord.nvim")

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	})

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		"williamboman/nvim-lsp-installer",
		"jose-elias-alvarez/null-ls.nvim",
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- completion
	use("hrsh7th/nvim-cmp") -- autocomplete
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("hrsh7th/cmp-nvim-lua") -- NVIM source for nvim-cmp
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	-- snippets
	use({
		"L3MON4D3/LuaSnip",
		config = function()
			require("user.snippets")
		end,
	})

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("p00f/nvim-ts-rainbow")

	-- Git
	use("lewis6991/gitsigns.nvim")
	-- use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use("folke/which-key.nvim")
	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({})
		end,
	})
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({})
		end,
	})
	use("ggandor/lightspeed.nvim")
	use("rmagatti/auto-session")
	use("beauwilliams/focus.nvim")
	use("yamatsum/nvim-cursorline")

	-- dap
	use("mfussenegger/nvim-dap")
	use("Pocco81/DAPInstall.nvim")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
