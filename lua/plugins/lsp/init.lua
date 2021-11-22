local installer = R('plugins.lsp.installer')
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
  nmap('<leader>ea', 'vim.my.fuzzyfinder.lsp.document_diagnostics()')

  nmap('<leader>fF', 'vim.lsp.buf.formatting()')

  print('LSP: ' .. client.name)
end

installer.setup(attacher, capabilities)

vim.my.lsp = {
  install_servers = installer.install
}

vim.my.utils.command('LspInstallServers lua vim.my.lsp.install_servers()')
