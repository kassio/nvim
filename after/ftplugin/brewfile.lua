local utils = require('my.utils')

vim.my.brewfile = {
  sort = function()
    utils.preserve(function()
      vim.cmd('silent! /^tap/,/^brew/-1!sort')
      vim.cmd('silent! /^brew/,/^cask/-1!sort')
      vim.cmd('silent! /^cask/,/^mas/-1!sort')
      vim.cmd('silent! /^mas/!sort')
    end)
  end,
}

vim.api.nvim_buf_create_user_command(0, 'Sort', vim.my.brewfile.sort)
