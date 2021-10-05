local buf_keymap = vim.my.utils.buf_keymap

buf_keymap(0, 'n', '<c-t>', ':exec "tab cc".line(".")<cr>')
buf_keymap(0, 'n', '<c-x>', ':exec "cc".line(".")<cr>')
buf_keymap(0, 'n', '<c-v>', ':exec "vert cc ".line(".")<cr>')

vim.opt_local.scrolloff = 0
