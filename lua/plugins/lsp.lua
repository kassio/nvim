local lspconfig = R('lspconfig')
local installer = R('plugins.lsp.installer')
local lsp = vim.lsp
local utils = vim.my.utils

lsp.handlers['textDocument/publishDiagnostics'] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
  signs = true,
  update_in_insert = true,

  virtual_text = false,
  underline = false,
})

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

  require('lsp_signature').on_attach()

  print('LSP: ' .. client.name)
end

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

local servers = installer.installed_servers()
local load_customization = function(customizations)
  for _, server in pairs(servers) do
    lspconfig[server].setup(vim.tbl_extend('keep', customizations[server] or {}, {
      on_attach = attacher,
      capabilities = capabilities,
    }))
  end
end

load_customization({
  lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  },

  sqlls = {
    cmd = { '$HOME/.asdf/shims/sql-language-server', 'up', '--method', 'stdio' },
  },

  solargraph = {
    settings = {
      solargraph = {
        completion = true,
        symbols = true,
        diagnostics = true,
        definitions = true,
        hover = true,
        references = true,
        rename = true,

        useBundler = false,
      },
    },
  },

  diagnosticls = {
    filetypes = {
      'markdown',
      'ruby',
      'sh',
    },

    init_options = {
      filetypes = {
        markdown = 'markdownlint',
        ruby = 'rubocop',
        sh = 'shellcheck',
      },
      linters = {
        markdownlint = {
          sourceName = 'markdownlint',
          isStderr = true,
          command = 'mdl',
          args = {
            '--config',
            '.markdownlint.json',
            '%filepath',
          },
          formatLines = 1,
          formatPattern = {
            '^([^:]+):(\\d+):(\\d+)?\\s*(.*)$',
            {
              sourceName = 1,
              sourceNameFilter = true,
              line = 2,
              column = 3,
              message = 4,
            },
          },
          securities = {
            undefined = 'warning',
          },
        },
        rubocop = {
          sourceName = 'rubocop',
          command = 'bundle',
          args = {
            'exec',
            'rubocop',
            '--format',
            'json',
            '--force-exclusion',
            '--stdin',
            '%filepath',
          },
          parseJson = {
            errorsRoot = 'files[0].offenses',
            line = 'location.start_line',
            endLine = 'location.last_line',
            column = 'location.start_column',
            endColumn = 'location.end_column',
            message = '[${cop_name}]\n${message}',
            security = 'severity',
          },
          securities = {
            fatal = 'error',
            error = 'error',
            warning = 'warning',
            convention = 'info',
            refactor = 'info',
            info = 'info',
          },
        },
        shellcheck = {
          sourceName = 'shellcheck',
          debounce = 100,
          command = 'shellcheck',
          args = {
            '--format',
            'json',
            '-',
          },
          parseJson = {
            line = 'line',
            column = 'column',
            endLine = 'endLine',
            endColumn = 'endColumn',
            message = '[${code}]\n${message}',
            security = 'level',
          },
          securities = {
            error = 'error',
            warning = 'warning',
            info = 'info',
            style = 'hint',
          },
        },
      },
    },
  },
})
