local loaded_formatter, formatter = pcall(require, 'formatter')
if not loaded_formatter then
    return
end

formatter.setup {
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        lua = { require('formatter.filetypes.lua').stylua },
        javascript = { require('formatter.filetypes.javascript').eslint_d },
        javascriptreact = { require('formatter.filetypes.javascriptreact').eslint_d },
        typescript = { require('formatter.filetypes.typescript').eslint_d },
        typescriptreact = { require('formatter.filetypes.typescriptreact').eslint_d },
        rust = { require('formatter.filetypes.rust').rustfmt },
    },
}

vim.api.nvim_create_augroup('FormatAutogroup', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'FormatWrite',
    group = 'FormatAutogroup',
})
