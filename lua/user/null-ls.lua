local has_loaded, null_ls = pcall(require, 'null-ls')
if not has_loaded then
  return
end

local eslint_condition = {
  condition = function(utils)
    return utils.root_has_file {
      'eslint.config.js',
      '.eslintrc',
      '.eslintrc.js',
      '.eslintrc.cjs',
      '.eslintrc.yaml',
      '.eslintrc.yml',
      '.eslintrc.json',
    }
  end,
}

local sources = {
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.gofumpt,
  null_ls.builtins.formatting.rustfmt,
  null_ls.builtins.formatting.eslint_d.with(eslint_condition),
  null_ls.builtins.diagnostics.eslint_d.with(eslint_condition),
}

local augroup = vim.api.nvim_create_augroup('LspFormatting', { clear = true })
null_ls.setup {
  debug = true,
  on_attach = function(client, bufnr)
    if client.supports_method 'textDocument/formatting' then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr, timeout_ms = 2000 }
        end,
      })
    end
  end,
  sources = sources,
}
