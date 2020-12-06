require'my/lspconfig'
require'my/fuzzyfinder'

require'colorizer'.setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = { enable = true },
  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = false
  }
}

local M = {}

M.telescope = require'telescope.builtin'

M.activeLSPClients = function()
  for _, client in ipairs(vim.lsp.get_active_clients()) do
    print(client.name)
  end
end

return M
