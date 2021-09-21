vim.my = {}
vim.my.utils = R('my.utils')
vim.my.buffers = R('my.buffers')
vim.my.windows = R('my.windows')
vim.my.sessions = R('my.sessions')
vim.my.ruby = R('my.ruby')

vim.my.colors = {
  error = '#CA1243',
  warn = '#F7C154',
  info = '#6699CC',
  hint = '#50A14F',
}

vim.my.signs = {
  error = '',
  warn = '',
  hint = '',
  info = '',
}

vim.my.reload = function()
  vim.cmd(string.format('luafile %s/init.lua', vim.fn.stdpath('config')))
end
