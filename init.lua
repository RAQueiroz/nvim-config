require('user.plugins')
require('user.options')
require('user.nvim-tree')
require('user.barbar')
require('user.cmp')
require('user.lsp')
require('user.keymaps')

require'lspconfig'.tsserver.setup{}
