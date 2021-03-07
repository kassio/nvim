local treesitter = require'nvim-treesitter.configs'

treesitter.setup{
    ensure_installed = 'all',
    highlight = {
      enable = true,
    },
    indent = {
      enable = false -- it's not working well with rspec
    },
    playground = {
      enable = true,
      updatetime = 25,
      persist_queries = false
    },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = {'BufWrite', 'CursorHold'},
    }
  }
