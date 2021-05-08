local treesitter = require'nvim-treesitter.configs'

treesitter.setup{
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { 'ruby' }
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
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = 'gnn',
      node_decremental = 'gnm',
    },
  },
}
