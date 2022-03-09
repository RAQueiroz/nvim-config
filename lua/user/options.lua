--vim.g.tokyonight_style= 'day'
--vim.cmd[[colorscheme tokyonight]]
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true })
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 2
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.termguicolors = true
-- force all horizontal splits to go below current window
-- ( make sure that the new splits go to the correct places. Good for nvim-tree and opening stuff with telescope)
vim.opt.splitbelow = true
vim.opt.splitright = true
