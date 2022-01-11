local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  use 'psliwka/vim-smoothie'

  use 'folke/tokyonight.nvim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    --config = function() require'nvim-tree'.setup {} end
  }

  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  --use {
    --'nvim-treesitter/nvim-treesitter',
    --branch = vim.fn.has 'nvim-0.6' == 1 and 'master' or '0.5-compat',
    --config = function ()
      --require('lvim.core.treesitter').setup()
    --end,
    --run = ':TSUpdate'
  --}

  use {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = 'BufReadPost',
  }

  -- completion
  use 'hrsh7th/nvim-cmp' -- autocomplete
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lua' -- NVIM source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  -- snippets
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
