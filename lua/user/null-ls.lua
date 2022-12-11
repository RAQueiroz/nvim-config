local has_loaded, null_ls = pcall(require, 'null-ls')
if not has_loaded then
    return
end

local augroup = vim.api.nvim_create_augroup('LspFormatting', { clear = true })

local sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.rustfmt,
}

-- get from env var FORMAT_WITH_PRETTIER
if Format_with_prettier then
    table.insert(sources, null_ls.builtins.formatting.prettier)
else
    local eslint_builtin = null_ls.builtins.formatting.eslint
    eslint_builtin.condition = function(utils)
        utils.root_has_file {
            'eslint.config.js',
            '.eslintrc',
            '.eslintrc.js',
            '.eslintrc.cjs',
            '.eslintrc.yaml',
            '.eslintrc.yml',
            '.eslintrc.json',
        }
    end
    table.insert(sources, eslint_builtin)
end

null_ls.setup {
    debug = true,
    on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format { bufnr = bufnr }
                end,
            })
        end
    end,
    sources = sources,
}
