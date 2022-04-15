local installer = require('plugins.lsp.installer')
local utils = vim.my.utils

-- Add additional capabilities supported by nvim-cmp
local protocol = vim.lsp.protocol
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  protocol.make_client_capabilities()
)
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
  utils.command('LspHover lua vim.lsp.buf.hover()')
  utils.command('LspRename lua vim.lsp.buf.rename()')
  utils.command('LspSignatureHelp lua vim.lsp.buf.signature_help()')

  utils.command('-nargs=1 LspWorkspaceSymbols Telescope lsp_workspace_symbols query=<args>')

  -- Keymaps
  utils.buf_keymap(0, 'n', 'glR', '<cmd>LspRestart<cr>')

  nmap('glD', 'vim.lsp.buf.declaration()')
  nmap('gld', 'vim.lsp.buf.definition()')
  nmap('glr', 'vim.lsp.buf.references()')
  nmap('glh', 'vim.lsp.buf.hover()')
  nmap('K', 'vim.lsp.buf.hover()')

  nmap('gla', 'vim.lsp.buf.code_action()')

  nmap('glf', 'vim.lsp.buf.formatting()')

  print('LSP: ' .. client.name)
end

-- Configure LSPs installed by installer
installer.setup(attacher, capabilities)

vim.my.lsp = {
  install_servers = installer.install,
}

vim.my.utils.command('LspInstallServers lua vim.my.lsp.install_servers()')
