local lspconfig = require'lspconfig'
local lsp = vim.lsp
local utils = require'my/utils'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local keymap = function(lhs, rhs)
  utils.lua_buf_keymap(0, 'n', lhs, rhs)
end

local function attacher(client)
  keymap('gd', 'vim.lsp.buf.definition()')
  keymap('K', 'vim.lsp.buf.hover()')
  keymap('<leader>ee', 'vim.lsp.diagnostic.show_line_diagnostics()')
  keymap('<leader>ea', 'vim.lsp.diagnostic.set_loclist()')

  print('LSP: ' .. client.name)
end

-- Ensure to load all the installed servers
-- The ones with custom configurations are re-loaded later
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  lspconfig[server].setup{
    on_attach = attacher
  }
end

lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
  lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    update_in_insert = true,

    virtual_text = false,
    underline = false
  }
)

lspconfig.html.setup{
  capabilities = capabilities,
  on_attach = attacher
}

lspconfig.sqlls.setup{
  cmd = {"$HOME/.asdf/shims/sql-language-server", "up", "--method", "stdio"};
}

lspconfig.solargraph.setup{
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
  on_attach = attacher
}

lspconfig.diagnosticls.setup{
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
  on_attach = attacher
}
