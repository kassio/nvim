local keymap = vim.keymap.set

vim.diagnostic.config({
  virtual_text = true,
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
keymap('n', 'glea', vim.diagnostic.setloclist)
keymap('n', 'gleA', vim.diagnostic.setqflist)
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
