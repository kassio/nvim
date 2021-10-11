local utils = require('my.utils')

vim.my.brewfile = {
  sort = function()
    utils.preserve(function()
      vim.cmd("g/^tap/m0")
      vim.cmd("/^tap/,/^brew/-1 sort")
      vim.cmd("/^brew/,/^cask/-1 sort")
      vim.cmd("/^cask/,/^mas/-1 sort")
      vim.cmd("/^mas/,$sort")
    end)
  end
}

utils.command("-buffer Sort lua vim.my.brewfile.sort()")
