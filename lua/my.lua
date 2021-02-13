local safeRequire = function(path, fn)
  status, lib = pcall(require, path)

  if status then
    if fn then fn(lib) end

    return lib
  else
    print("'"..path.."' failed to load")
    print(lib)
  end
end

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
  safeRequire'my/autocmd'
  safeRequire'my/command'
  safeRequire'my/keymap'

  -- libs
  safeRequire('colorizer', function(lib)
    lib.setup()
  end)
  safeRequire'my/lib/completion'
  safeRequire'my/lib/file-tree'
  safeRequire'my/lib/lspconfig'
  safeRequire'my/lib/treesitter'
  safeRequire('my/lib/fuzzyfinder', function(lib)
    M.fuzzy_finder = lib
  end)
end

M.utils = safeRequire'my/utils'

return M
