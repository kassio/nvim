vim.my.completion.buffer.sources({
  'lua',
  'lsp',
  'snippets',
  'treesitter',
  'buffer',
  'spell',
  'path',
})

vim.api.nvim_create_autocmd({ 'BufWritePre', 'FileWritePre' }, {
  pattern = '*.lua',
  callback = vim.my.lsp.format_and_save,
})
