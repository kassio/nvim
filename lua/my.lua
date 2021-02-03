local M = {}

local setupPluginManager = function()
  local execute = vim.api.nvim_command
  local fn = vim.fn

  local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
  end
end

M.upgrade = function()
  require'my/plugins'
  local packer = require'packer'

  packer.compile()
  packer.sync()
end

M.setup = function()
  setupPluginManager()

  require'my/completion'
  require'my/file-tree'
  require'my/fuzzyfinder'
  require'my/lspconfig'
  require'my/treesitter'

  require'colorizer'.setup()

  vim.cmd [[command! Upgrade lua require('my').upgrade()]]
end

return M
