local treesitter = R('nvim-treesitter.configs')
local command = vim.my.utils.command

treesitter.setup({
  ensure_installed = 'maintained',
  ignore_install = { 'kotlin' },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { 'ruby' },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = 'gnn',
      node_decremental = 'gnm',
    },
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ['ab'] = '@block.outer',
        ['ib'] = '@block.inner',
        ['am'] = '@function.outer',
        ['im'] = '@function.inner',
        ['aM'] = '@class.outer',
        ['iM'] = '@class.inner',
      },
    },
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
    navigation = { enable = true },
    smart_rename = { enable = true },
  },
  matchup = {
    enable = true,
  },
  playground = {
    enable = true,
    updatetime = 25,
    persist_queries = false,
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { 'BufWrite', 'CursorHold' },
  },
})

R('spellsitter').setup({
  hl = 'SpellBad',
  captures = { 'comment', 'string' },
})

local gps = R('nvim-gps')
gps.setup({
  icons = {
    default = {
      ['class-name'] = ' ',
      ['function-name'] = ' ',
      ['method-name'] = ' ',
      ['container-name'] = ' ',
      ['tag-name'] = ' ',
    },
    ruby = {
      ['class-name'] = '::',
      ['function-name'] = '.',
      ['method-name'] = '#',
      ['container-name'] = '::',
      ['tag-name'] = '',
    },
  },
  separator = {
    default = ' › ',
    ruby = '',
  },
})

vim.my.treesitter = {
  current_namespace = gps.get_location,
  current_namespace_available = gps.is_available,
}

command('-bang TSNamespace lua print(vim.my.treesitter.current_namespace())')
command('-bang TSNamespaceCopy lua vim.my.utils.to_clipboard(vim.my.treesitter.current_namespace(), "<bang>")')
