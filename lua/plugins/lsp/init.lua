local installer = require('plugins.lsp.installer')
local lsp = vim.lsp
local utils = vim.my.utils

lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
  signs = true,
  update_in_insert = true,

  virtual_text = false,
  underline = false,
})

-- Add additional capabilities supported by nvim-cmp
local protocol = vim.lsp.protocol
local capabilities = require('cmp_nvim_lsp').update_capabilities(protocol.make_client_capabilities())
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
  -- Commands
  utils.command('LspCodeActions lua vim.lsp.buf.code_action()')
  utils.command('LspFormat lua vim.lsp.buf.formatting()')
  utils.command('LspFormatSync lua vim.lsp.buf.formatting_sync()')

  -- Keymaps
  utils.buf_keymap(0, 'n', 'glR', '<cmd>LspRestart<cr>')

  nmap('glD', 'vim.lsp.buf.declaration()')
  nmap('gld', 'vim.lsp.buf.definition()')
  nmap('glr', 'vim.lsp.buf.references()')
  nmap('glh', 'vim.lsp.buf.hover()')
  nmap('K', 'vim.lsp.buf.hover()')

  nmap('gla', 'vim.lsp.buf.code_action()')

  nmap('glf', 'vim.lsp.buf.formatting()')

  nmap('glee', 'vim.lsp.diagnostic.show_line_diagnostics()')
  nmap('glea', 'vim.my.fuzzyfinder.lsp.document_diagnostics()')

  print('LSP: ' .. client.name)
end

installer.setup(attacher, capabilities)

vim.my.lsp = {
  install_servers = installer.install
}

vim.my.utils.command('LspInstallServers lua vim.my.lsp.install_servers()')
