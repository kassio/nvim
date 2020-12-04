require'my/lspconfig'
require'my/fuzzyfinder'

require'colorizer'.setup{}

local M = {}

M.activeLSPClients = function()
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    print(client.name)
  end
end

return M
