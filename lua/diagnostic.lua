local keymap = vim.keymap.set

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

keymap('n', 'glee', vim.diagnostic.open_float)
keymap('n', 'glea', function()
  vim.cmd('cclose')
  vim.diagnostic.setloclist()
end)
keymap('n', 'gleA', function()
  vim.cmd('cclose')
  vim.diagnostic.setqflist()
end)
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
