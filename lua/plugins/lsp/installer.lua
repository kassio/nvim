local lspconfig = require('lspconfig')
local installer = require('nvim-lsp-installer')
local customizations = require('plugins.lsp.customizations')
local generics = require('plugins.lsp.generics')
local theme = vim.my.theme

local M = {}

M.servers = {
  'bashls',
  'cssls',
  'gopls',
  'golangci_lint_ls',
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
      vim.notify('LSP server installed but not registered: ' .. server, vim.log.levels.ERROR)
      break
    end
  end

  for _, server in ipairs(M.servers) do
    if not vim.tbl_contains(installed, server) then
      vim.notify('LSP server not installed: ' .. server, vim.log.levels.ERROR)
      break
    end
  end
end

M.setup = function(attacher, capabilities)
  local default_opts = {
    single_file_support = true,
    on_attach = attacher,
    capabilities = capabilities,
  }

  check_installed()

  installer.setup({
    ui = {
      icons = {
        server_installed = theme.signs.info,
        server_pending = theme.signs.warn,
        server_uninstalled = theme.signs.error,
      },
    },
  })

  generics.setup()

  for _, server in ipairs(M.servers) do
    local settings = customizations[server] or {}

    lspconfig[server].setup(vim.tbl_extend('keep', settings, default_opts))
  end
end

M.install = function()
  for _, server in ipairs(M.servers) do
    installer.install(server)
  end
end

return M
