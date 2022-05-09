local keymap = vim.keymap.set
local diagnostic = vim.diagnostic

diagnostic.config({
  virtual_text = {
    severity = diagnostic.severity.ERROR,
    spacing = 8,
  },
  underline = false,
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

keymap('n', '[d', diagnostic.goto_prev)
keymap('n', ']d', diagnostic.goto_next)
keymap('n', 'glee', diagnostic.open_float)
keymap('n', 'glea', function()
  vim.cmd('cclose')
  diagnostic.setloclist()
end)
keymap('n', 'gleA', function()
  vim.cmd('cclose')
  diagnostic.setqflist()
end)
