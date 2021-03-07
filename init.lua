local packer_path = '/site/pack/packer/opt/packer.nvim'
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..packer_path

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute('packadd packer.nvim')
end

-- settings
require'my/option'
require'my/global'
require'my/keymap'
require'my/autocmd'
require'my/command'

-- libs
require'my/plugin/completion'
require'my/plugin/file-tree'
require'my/plugin/lspconfig'
require'my/plugin/treesitter'
require'my/plugin/fuzzyfinder'
require'my/plugin/statusline'
require'colorizer'.setup()
