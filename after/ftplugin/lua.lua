vim.my.completion.buffer.sources({
  'lua',
  'snippets',
  'treesitter',
  'buffer',
  'spell',
  'path',
})

vim.my.utils.augroup('user:ftplugin:lua', {
  { 'BufWritePre,FileWritePre', '*.lua', 'lua vim.my.lsp.format_and_save()' },
})
