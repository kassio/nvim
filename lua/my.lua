vim.my = {}
vim.my.utils = R('my.utils')
vim.my.buffers = R('my.buffers')
vim.my.windows = R('my.windows')

vim.my.reload = function()
  vim.cmd(string.format('luafile %s/init.lua', vim.fn.stdpath('config')))
end
