vim.my.brewfile = {
  sort = function()
    vim.cmd("sort /\v^(brew|cask|mas).*/")
    vim.cmd("sort /^tap.*/")
  end
}

vim.my.utils.command("-buffer Sort lua vim.my.brewfile.sort()")
