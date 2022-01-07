local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '≤', ':BufferPrevious<CR>', opts)
map('n', '≥', ':BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '¯', ':BufferMovePrevious<CR>', opts)
map('n', '˘', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '¡', ':BufferGoto 1<CR>', opts)
map('n', '™', ':BufferGoto 2<CR>', opts)
map('n', '£', ':BufferGoto 3<CR>', opts)
map('n', '¢', ':BufferGoto 4<CR>', opts)
map('n', '∞', ':BufferGoto 5<CR>', opts)
map('n', '§', ':BufferGoto 6<CR>', opts)
map('n', '¶', ':BufferGoto 7<CR>', opts)
map('n', '•', ':BufferGoto 8<CR>', opts)
map('n', 'ª', ':BufferGoto 9<CR>', opts)
map('n', 'º', ':BufferLast<CR>', opts)
-- Close buffer
map('n', 'ç', ':BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map('n', 'π', ':BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)

