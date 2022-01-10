vim.cmd [[packadd packer.nvim]] 

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'psliwka/vim-smoothie'

  use 'folke/tokyonight.nvim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    config = function() require'nvim-tree'.setup {} end
  }

  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    branch = vim.fn.has 'nvim-0.6' == 1 and 'master' or '0.5-compat',
    config = function ()
      require('lvim.core.treesitter').setup()
    end,
  }

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
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  -- snippets
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
end)
