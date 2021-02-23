local treesitter = require'nvim-treesitter.configs'

treesitter.setup{
  ensure_installed = 'all',
  highlight = { enable = true },
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
