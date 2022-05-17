local lsp = vim.lsp
local hdls = lsp.handlers
local installer = require('plugins.lsp.installer')
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

hdls['textDocument/hover'] = lsp.with(hdls.hover, { border = 'rounded' })
hdls['textDocument/signatureHelp'] = lsp.with(hdls.signature_help, { border = 'rounded' })

local nmap = function(lhs, rhs)
  vim.keymap.set('n', lhs, rhs, { buffer = 0, silent = true })
end

local command_map = function(fn, name, map)
  command(name, fn, {})

  if map ~= nil then
    nmap(map, string.format('<cmd>%s<cr>', name))
  end
end

local attacher = function(client)
  -- Commands
  command_map(lsp.buf.code_action, 'LspCodeActions', 'gla')
  command_map(lsp.buf.hover, 'LspHover', 'K')
  command_map(lsp.buf.rename, 'LspRename', 'grr')
  command_map(lsp.buf.signature_help, 'LspSignatureHelp', '<c-k>')
  command_map(lsp.buf.declaration, 'LspGoToDeclaration', 'glD')

  command_map(function()
    vim.cmd('Telescope lsp_implementations jump_type=split')
  end, 'LspImplementation', 'gli')

  command_map(lsp.buf.format, 'LspFormatSync', 'glF')
  command_map(function()
    lsp.buf.format({ async = true })
  end, 'LspFormat', 'glf')

  command_map(function()
    vim.cmd('Telescope lsp_definitions jump_type=split')
  end, 'LspGoToDefinition', 'gld')

  command_map(function()
    vim.cmd('Telescope lsp_references')
  end, 'LspListReferences', 'glr')

  command_map(function()
    vim.cmd('Telescope lsp_document_symbols')
  end, 'LspDocumentSymbols', 'gls')

  command_map(function()
    vim.cmd('Telescope lsp_dynamic_workspace_symbols')
  end, 'LspWorkspaceSymbols', 'glS')

  print('LSP: ' .. client.name)
end

-- Configure LSPs installed by installer
installer.setup(attacher, capabilities)

vim.my.lsp = {
  install_servers = installer.install,
}

command('LspUpdateServers', vim.my.lsp.install_servers, {})

-- Auto format files
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = '*.lua,*.go,*.rb,*.json,*.js',
  callback = function()
    P(lsp.buf.format)
    lsp.buf.format({ async = false })
  end,
})
