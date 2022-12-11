local nvim_tree_ok, nvim_tree = pcall(require, 'nvim-tree')
if not nvim_tree_ok then
    return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local config = {
    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = 'l', action = 'edit', action_cb = edit_or_open },
                { key = 'L', action = 'vsplit_preview', action_cb = vsplit_preview },
                { key = 'h', action = 'close_node' },
                { key = 'H', action = 'collapse_all', action_cb = collapse_all },
            },
        },
    },
    actions = {
        open_file = {
            quit_on_open = false,
        },
    },
}

vim.api.nvim_set_keymap('n', '<C-h>', ':NvimTreeToggle<cr>', { silent = true, noremap = true })
nvim_tree.setup(config)
