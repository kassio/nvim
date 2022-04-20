local util = require('lspconfig.util')
local fn = vim.fn

return {
  sumneko_lua = {
    root_dir = util.root_pattern('.stylua.toml'),
    settings = {
      Lua = {
        format = {
          enabled = false,
        },
        diagnostics = {
          globals = {
            'vim',
            'hs', -- hammerspoon
          },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = {
            [fn.expand('$VIMRUNTIME/lua')] = true,
            [fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
          },
        },
      },
    },
  },

  gopls = {
    root_dir = util.root_pattern('.git', 'go.mod'),
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        gofumpt = false,
        codelenses = {
          generate = true,
          gc_details = true,
        },
        analyses = {
          nilness = true,
          shadow = true,
          unusedparams = true,
          unusedwrite = true,
        },
      },
    },
  },

  sqlls = {
    cmd = { '$HOME/.asdf/shims/sql-language-server', 'up', '--method', 'stdio' },
  },

  solargraph = {
    root_dir = util.root_pattern('.git', 'Gemfile'),
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
}
