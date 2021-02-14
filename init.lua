local packer_path = '/site/pack/packer/opt/packer.nvim'
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..packer_path

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute('packadd packer.nvim')
end

local safeRequire = function(path, fn)
  status, lib = pcall(require, path)

  if not status then
    print("'"..path.."' failed to load")
    print(lib)
  end
end

-- settings
safeRequire'my/option'
safeRequire'my/global'
safeRequire'my/keymap'
safeRequire'my/autocmd'
safeRequire'my/command'

-- libs
safeRequire'my/plugin/completion'
safeRequire'my/plugin/file-tree'
safeRequire'my/plugin/lspconfig'
safeRequire'my/plugin/treesitter'
safeRequire'my/plugin/fuzzyfinder'
safeRequire'my/plugin/colorizer'
