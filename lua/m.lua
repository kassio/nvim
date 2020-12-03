local M = {}

function M.activeLSPClients()
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    print(client.name)
  end
end

return M
