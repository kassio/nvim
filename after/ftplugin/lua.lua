vim.my.completion.buffer.sources({
  'lua',
  'lsp',
  'snippets',
  'treesitter',
  'buffer',
  'spell',
  'path',
})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = '*.lua',
  callback = vim.lsp.buf.formatting_sync,
})
