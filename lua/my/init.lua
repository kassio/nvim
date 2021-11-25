vim.my = {}
vim.my.buffers = require('my.buffers')
vim.my.sessions = require('my.sessions')
vim.my.snippets = require('my.snippets')
vim.my.theme = require('my.theme')
vim.my.utils = require('my.utils')
vim.my.windows = require('my.windows')

vim.my.reload = function()
  for p, _ in ipairs(package.loaded) do
    package.loaded[p] = nil
  end
  vim.cmd(string.format('luafile %s/init.lua', vim.fn.stdpath('config')))
end
