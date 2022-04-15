local installer = require('plugins.lsp.installer')
local utils = vim.my.utils
local command = vim.api.nvim_create_user_command

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
  command('LspCodeActions', vim.lsp.buf.code_action, {})
  command('LspFormat', vim.lsp.buf.formatting, {})
  command('LspFormatSync', vim.lsp.buf.formatting_sync, {})
  command('LspHover', vim.lsp.buf.hover, {})
  command('LspRename', vim.lsp.buf.rename, {})
  command('LspSignatureHelp', vim.lsp.buf.signature_help, {})

  command('LspWorkspaceSymbols', function(cmd)
    vim.cmd('Telescope lsp_workspace_symbols query=' .. cmd.args)
  end, { nargs = 1 })

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

command('LspInstallServers', vim.my.lsp.install_servers, {})
