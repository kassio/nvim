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
  require'my/command'
  require'my/keymap'

  -- libs
  require'colorizer'.setup()
  require'my/lib/completion'
  require'my/lib/file-tree'
  require'my/lib/lspconfig'
  require'my/lib/treesitter'
  M.fuzzy_finder = require'my/plugin/fuzzyfinder'
end

return M
