vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = false

vim.my.completion.buffer.sources({
  'lsp',
  'snippets',
  'treesitter',
  'buffer',
  'spell',
  'path',
})

vim.cmd('Tmap clear; go run %')

vim.my.utils.augroup('user:ftplugin:go', {
  { 'BufWritePre,FileWritePre', '*.go', 'lua vim.lsp.buf.formatting()' },
})
