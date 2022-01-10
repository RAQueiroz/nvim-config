require('plugins')
require('config')
require('config-nvim-tree')
require('config-barbar')
require('config-completion')

require'lspconfig'.tsserver.setup{}
