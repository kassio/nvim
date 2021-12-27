vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = false

vim.my.utils.augroup('user:ftplugin:go', {
  { 'BufWritePre,FileWritePre', '*.go', 'lua vim.my.lsp.format_and_save()' },
})
