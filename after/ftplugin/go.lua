vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = false

vim.cmd('Tmap go run %')

local dap_go = require('dap-go')
dap_go.setup()

vim.api.nvim_create_user_command('GoDebugTest', dap_go.debug_test, {})
vim.keymap.set('n', '<leader>dt', '<cmd>GoDebugTest<cr>')
