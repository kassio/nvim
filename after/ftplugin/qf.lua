local buf_keymap = function(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { buffer = 0, silent = true })
end

buf_keymap('n', '<c-t>', ':exec "tab cc".line(".")<cr>')
buf_keymap('n', '<c-x>', ':exec "cc".line(".")<cr>')
buf_keymap('n', '<c-v>', ':exec "vert cc ".line(".")<cr>')

vim.opt_local.scrolloff = 0
