local lspconfig = R('lspconfig')
local installer = R('nvim-lsp-installer')
local customizations = R('plugins.lsp.customizations')
local lsp = vim.lsp
local utils = vim.my.utils

installer.settings({
  ui = {
    icons = {
      server_installed = vim.my.signs.info,
      server_pending = vim.my.signs.warn,
      server_uninstalled = vim.my.signs.error,
    },
  },
})

vim.my.lsp = {
  installer = {
    installAll = function()
      local languages = {
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

      for _, language in ipairs(languages) do
        installer.install(language)
      end
    end,
  },
}

lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
  signs = true,
  update_in_insert = true,

  virtual_text = false,
  underline = false,
})

-- Add additional capabilities supported by nvim-cmp
local protocol = vim.lsp.protocol
local capabilities = R('cmp_nvim_lsp').update_capabilities(protocol.make_client_capabilities())
local completionItem = capabilities.textDocument.completion.completionItem
completionItem.documentationFormat = { 'markdown', 'plaintext' }
completionItem.snippetSupport = true
completionItem.preselectSupport = true
completionItem.insertReplaceSupport = true
completionItem.labelDetailsSupport = true
completionItem.deprecatedSupport = true
completionItem.commitCharactersSupport = true
completionItem.tagSupport = { valueSet = { 1 } }
completionItem.resolveSupport = {
  properties = { 'documentation', 'detail', 'additionalTextEdits' },
}

local nmap = function(lhs, rhs)
  utils.lua_buf_keymap(0, 'n', lhs, rhs)
end

local attacher = function(client)
  nmap('gD', 'vim.lsp.buf.declaration()')
  nmap('gd', 'vim.lsp.buf.definition()')
  nmap('gr', 'vim.lsp.buf.references()')
  nmap('K', 'vim.lsp.buf.hover()')

  nmap('<leader>ee', 'vim.lsp.diagnostic.show_line_diagnostics()')
  nmap('<leader>ea', 'vim.lsp.diagnostic.set_loclist()')

  nmap('<leader>FF', 'vim.lsp.buf.formatting()')

  print('LSP: ' .. client.name)
end

installer.on_server_ready(function(server)
  server:setup(vim.tbl_extend('keep', customizations[server_name] or {}, {
    on_attach = attacher,
    capabilities = capabilities,
  }))
end)

vim.my.utils.command('LspInstallAll lua vim.my.lsp.installer.installAll()')
