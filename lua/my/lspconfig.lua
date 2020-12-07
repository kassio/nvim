local lspconfig = require'lspconfig'

local map = function(lhs, rhs)
  vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, { noremap = true, silent = true })
end

local function attacher(client)
  map('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
  map('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  map('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  map('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
  map('gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
  map('gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
  map('gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
  map('<leader>gw', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
  map('<leader>gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
  map('<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  map('<leader>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
  map('<leader>ar', '<cmd>lua vim.lsp.buf.rename()<CR>')

  print('LSP: ' .. client.name)
end

lspconfig.vimls.setup{ on_attach = attacher }
lspconfig.jsonls.setup{ on_attach = attacher }
lspconfig.cssls.setup{ on_attach = attacher }

lspconfig.solargraph.setup{
  settings = {
    solargraph = {
      completion = true,
      definitions = true,
      diagnostics = true,
      filetypes = {'ruby'},
      hover = true,
      references = true,
      rename = true,
      root_dir = {'.'},
      symbols = true,
      useBundler = false
    }
  },

  on_attach = attacher
}

lspconfig.sumneko_lua.setup{
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = { 'vim', 'my' },
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
        }
      }
    }
  },

  on_attach = attacher
}

lspconfig.diagnosticls.setup{
  filetypes = {
    'markdown',
    'ruby',
    'sh',
    'vim',
    'yaml'
  },

  init_options = {
    linters = {
      rubocop = {
        command = 'bundle',
        sourceName = 'rubocop',
        args = {
          'exec',
          'rubocop',
          '--format',
          'json',
          '--force-exclusion',
          '%filepath'
        },
        parseJson = {
          errorsRoot = 'files[0].offenses',
          line = 'location.line',
          column = 'location.column',
          message = '[${cop_name}]\n${message}',
          security = 'severity'
        },
        securities = {
          fatal = 'error',
          warning = 'warning'
        }
      },
      markdownlint = {
        command = 'markdownlint',
        sourceName = 'markdownlint',
        isStderr = true,
        args = {
          '--config',
          '.markdownlint.json',
          '%filepath'
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
          }
        },
        securities = {
          undefined = 'warning'
        }
      },
      shellcheck = {
        command = 'shellcheck',
        debounce = 100,
        args = {
          '--format',
          'json',
          '-'
        },
        sourceName = 'shellcheck',
        parseJson = {
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '${message} [${code}]',
          security = 'level'
        },
        securities = {
          error = 'error',
          warning = 'warning',
          info = 'info',
          style = 'hint'
        }
      },
      vint = {
        command = 'vint',
        debounce = 100,
        args = {
          '--enable-neovim',
          '-'
        },
        offsetLine = 0,
        offsetColumn = 0,
        sourceName = 'vint',
        formatLines = 1,
        formatPattern = {
          '[^:]+:(\\d+):(\\d+):\\s*(.*)(\\r|\\n)*$',
          {
            line = 1,
            column = 2,
            message = 3
          }
        }
      }
    },

    filetypes = {
      markdown = 'markdownlint',
      ruby = 'rubocop',
      sh = 'shellcheck',
      vim = 'vint',
    }
  },

  on_attach = attacher
}
