local treesitter = require'nvim-treesitter.configs'

treesitter.setup{
  ensure_installed = "all",
  highlight = { enable = false },
  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = false
  }
}
