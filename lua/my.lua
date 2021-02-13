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

M.setup = function()
  setupPluginManager()

  -- settings
  require'my/autocmd'

  -- libs
  require'colorizer'.setup()

  -- libs customizations
  require'my/completion'
  require'my/file-tree'
  require'my/lspconfig'
  require'my/treesitter'

  -- personal interface for libs
  M.fuzzy_finder = require'my/fuzzyfinder'

  vim.cmd [[command! Upgrade lua require('my/plugins').sync()]]
end

return M
