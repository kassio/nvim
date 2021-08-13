local lspconfig = require'lspconfig'
local lsp = vim.lsp
local utils = require'my/utils'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
  lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    update_in_insert = true,

    virtual_text = false,
    underline = false
  }
)

local nnoremap = function(lhs, rhs)
  utils.lua_buf_keymap(0, 'n', lhs, rhs)
end

local function attacher(client)
  nnoremap('gD', 'vim.lsp.buf.declaration()')
  nnoremap('gd', 'vim.lsp.buf.definition()')
  nnoremap('gr', 'vim.lsp.buf.references()')
  nnoremap('K', 'vim.lsp.buf.hover()')

  nnoremap('<leader>ee', 'vim.lsp.diagnostic.show_line_diagnostics()')
  nnoremap('<leader>ea', 'vim.lsp.diagnostic.set_loclist()')

  nnoremap('<leader>ff', 'vim.lsp.buf.formatting()')

  print('LSP: ' .. client.name)
end

local servers = require'lspinstall'.installed_servers()
local load_customization = function(customizations)
  for _, server in pairs(servers) do
    lspconfig[server].setup(
      vim.tbl_extend(
        'keep',
        customizations[server] or {},
        { on_attach = attacher }
      )
    )
  end
end

load_customization{
  html = {
    capabilities = capabilities,
  },

  lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  },

  sqlls = {
    cmd = {"$HOME/.asdf/shims/sql-language-server", "up", "--method", "stdio"};
  },

  solargraph = {
    settings = {
      solargraph = {
        completion = true,
        symbols = true,
        diagnostics = true,

        definitions = false,
        hover = false,
        references = false,
        rename = false,
        useBundler = false
      }
    },
  },

  diagnosticls = {
    filetypes = {
      'markdown',
      'ruby',
      'sh'
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
            info = 'info'
          }
        },
        shellcheck = {
          sourceName = 'shellcheck',
          debounce = 100,
          command = 'shellcheck',
          args = {
            '--format',
            'json',
            '-'
          },
          parseJson = {
            line = 'line',
            column = 'column',
            endLine = 'endLine',
            endColumn = 'endColumn',
            message = '[${code}]\n${message}',
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
    },
  }
}
