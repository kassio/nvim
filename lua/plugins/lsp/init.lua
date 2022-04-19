local lsp = vim.lsp
local installer = require('plugins.lsp.installer')
local utils = vim.my.utils
local command = vim.api.nvim_create_user_command

-- Add additional capabilities supported by nvim-cmp
local protocol = lsp.protocol
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

lsp.handlers['textDocument/hover'] = lsp.with(lsp.handlers.hover, { border = 'single' })

local nmap = function(lhs, rhs)
  vim.keymap.set('n', lhs, rhs, { buffer = 0, silent = true })
end

local attacher = function(client)
  -- Commands
  command('LspCodeActions', lsp.buf.code_action, {})
  command('LspFormat', lsp.buf.formatting, {})
  command('LspFormatSync', lsp.buf.formatting_sync, {})
  command('LspHover', lsp.buf.hover, {})
  command('LspRename', lsp.buf.rename, {})
  command('LspSignatureHelp', lsp.buf.signature_help, {})
  command('LspGoToDefinition', lsp.buf.definition, {})
  command('LspGoToDeclaration', lsp.buf.declaration, {})
  command('LspListReferences', lsp.buf.references, {})

  command('LspWorkspaceSymbols', function(cmd)
    vim.cmd('Telescope lsp_workspace_symbols query=' .. cmd.args)
  end, { nargs = 1 })

  -- Keymaps
  nmap('glR', '<cmd>LspRestart<cr>')
  nmap('glD', lsp.buf.declaration)
  nmap('gld', lsp.buf.definition)
  nmap('glr', lsp.buf.references)
  nmap('glh', lsp.buf.hover)
  nmap('K', lsp.buf.hover)
  nmap('<c-k>', lsp.buf.signature_help)
  nmap('gla', lsp.buf.code_action)
  nmap('glf', lsp.buf.formatting)
  nmap('[d', vim.lsp.diagnostic.goto_prev)
  nmap(']d', vim.lsp.diagnostic.goto_next)

  print('LSP: ' .. client.name)
end

-- Configure LSPs installed by installer
installer.setup(attacher, capabilities)

vim.my.lsp = {
  install_servers = installer.install,
}

command('LspInstallServers', vim.my.lsp.install_servers, {})

-- Auto format files
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = '*.lua,*.go,*.rb,*.json,*.js',
  callback = lsp.buf.formatting_sync,
})
