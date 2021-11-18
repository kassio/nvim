local current_dir = function()
  return '.'
end

return {
  sumneko_lua = {
    root_dir = current_dir,
    settings = {
      Lua = {
        diagnostics = {
          globals = {
            'vim',
            'hs', -- hammerspoon
          },
        },
      },
    },
  },

  gopls = {
    root_dir = current_dir,
  },

  sqlls = {
    cmd = { '$HOME/.asdf/shims/sql-language-server', 'up', '--method', 'stdio' },
  },

  solargraph = {
    root_dir = current_dir,
    settings = {
      solargraph = {
        completion = true,
        symbols = true,
        diagnostics = true,
        definitions = true,
        hover = true,
        references = true,
        rename = true,
        useBundler = true,
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
            convention = 'hint',
            refactor = 'hint',
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
}
