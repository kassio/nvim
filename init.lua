local command = vim.cmd
local fn = vim.fn
local packer_path = '/site/pack/packer/opt/packer.nvim'
local install_path = fn.stdpath('data') .. packer_path

if fn.empty(fn.glob(install_path)) > 0 then
  command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  command('packadd packer.nvim')
end

-- P = Print with inpect
P = function(anything)
  print(vim.inspect(anything))
end

-- R = Reload
-- Reloads a package by name
-- If it fails to be loaded the error is printed
R = function(name)
  package.loaded[name] = nil
  local status, result = pcall(require, name)

  if status then
    return result -- package
  else
    print('Failed to load '..name)
    print(result) -- error message
  end
end

-- settings
R'my/option'
R'my/global'
R'my/keymap'
R'my/autocmd'
R'my/command'
R'my/tabline'

-- libs
R'my/plugin/completion'
R'my/plugin/file-tree'
R'my/plugin/lspconfig'
R'my/plugin/treesitter'
R'my/plugin/fuzzyfinder'
R'my/plugin/statusline'
R'colorizer'.setup()
