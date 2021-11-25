local installer = require('nvim-lsp-installer')
local customizations = require('plugins.lsp.customizations')
local theme = vim.my.theme

local M = {}

M.servers = {
  'bashls',
  'cssls',
  'diagnosticls',
  'gopls',
  'graphql',
  'html',
  'jsonls',
  'solargraph',
  'sqlls',
  'sqls',
  'sumneko_lua',
  'tailwindcss',
  'vimls',
  'vuels',
  'yamlls',
}

local check_installed = function()
  local installed = vim.tbl_map(function(config)
    return config.name
  end, installer.get_installed_servers())

  for _, server in ipairs(installed) do
    if not vim.tbl_contains(M.servers, server) then
      vim.notify('LSP servers list missing: ' .. server, vim.log.levels.ERROR)
      break
    end
  end
end

M.setup = function(attacher, capabilities)
  check_installed()

  installer.settings({
    ui = {
      icons = {
        server_installed = theme.signs.info,
        server_pending = theme.signs.warn,
        server_uninstalled = theme.signs.error,
      },
    },
  })

  installer.on_server_ready(function(server)
    server:setup(vim.tbl_extend('keep', customizations[server.name] or {}, {
      on_attach = attacher,
      capabilities = capabilities,
    }))
  end)
end

M.install = function()
  for _, server in ipairs(M.servers) do
    installer.install(server)
  end
end

return M
