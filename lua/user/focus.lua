local status_ok, _ = pcall(require, "focus")
if not status_ok then
  return
end


local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<S-l>', ':FocusSplitNicely<CR>', opts)
map('n', '<C-h>', ':FocusSplitLeft<CR>', opts)
map('n', '<C-j>', ':FocusSplitDown<CR>', opts)
map('n', '<C-k>', ':FocusSplitUp<CR>', opts)
map('n', '<C-l>', ':FocusSplitRight<CR>', opts)
