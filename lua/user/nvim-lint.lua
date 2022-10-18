local loaded_lint, lint = pcall(require, 'lint')
if not loaded_lint then
    return
end

lint.linters_by_ft = {
    javascript = { 'eslint' },
    javascriptreact = { 'eslint' },
    typescript = { 'eslint' },
    typescriptreact = { 'eslint' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    callback = function()
        lint.try_lint()
    end,
})
