local lspconfig = require'lspconfig'

local nmap = function(lhs, rhs)
  vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, { noremap = true, silent = true })
end

local function attacher(client)
  nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
  nmap('K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  nmap('<leader>ee', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')

  print('LSP: ' .. client.name)
end

lspconfig.vimls.setup{ on_attach = attacher }
lspconfig.jsonls.setup{ on_attach = attacher }
lspconfig.cssls.setup{ on_attach = attacher }

lspconfig.solargraph.setup{
  settings = {
    solargraph = {
      completion = true,
      definitions = false,
      diagnostics = false,
      filetypes = {'ruby'},
      hover = false,
      references = false,
      rename = false,
      root_dir = {'.'},
      symbols = false,
      useBundler = false
    }
  },
  on_attach = attacher
}

  lspconfig.diagnosticls.setup{
    filetypes = {
      'markdown',
      'ruby',
      'sh',
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
      },

      filetypes = {
        markdown = 'markdownlint',
        ruby = 'rubocop',
        sh = 'shellcheck',
      }
    },
    on_attach = attacher
  }
