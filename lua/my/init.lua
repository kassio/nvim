vim.my = {}
vim.my.buffers = R('my.buffers')
vim.my.sessions = R('my.sessions')
vim.my.snippets = R('my.snippets')
vim.my.theme = R('my.theme')
vim.my.utils = R('my.utils')
vim.my.windows = R('my.windows')

vim.my.reload = function()
  vim.cmd(string.format('luafile %s/init.lua', vim.fn.stdpath('config')))
end
