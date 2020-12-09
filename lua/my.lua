my = {}

my.setupPluginManager = function()
  local execute = vim.api.nvim_command
  local fn = vim.fn

  local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
  end
end

my.setupPlugins = function()
  require'my/lspconfig'
  require'my/fuzzyfinder'
  require'my/treesitter'

  require'colorizer'.setup()
end

my.telescope = require'telescope.builtin'

my.activeLSPClients = function()
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    print(client.name)
  end
end

return my
