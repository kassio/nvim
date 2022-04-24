vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = false

vim.cmd('Tmap go run %')

vim.api.nvim_create_user_command('GoDebugTest', require('dap-go').debug_test, {})
vim.keymap.set('n', '<leader>dT', '<cmd>GoDebugTest<cr>')
