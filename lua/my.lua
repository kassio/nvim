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

  require'my/lspconfig'
  require'my/fuzzyfinder'
  require'my/treesitter'

  require'colorizer'.setup()
end

return M
