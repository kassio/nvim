local command = vim.my.utils.command
local treesitter = R('nvim-treesitter.configs')
local spellsitter = R('spellsitter')
local gps = R('nvim-gps')

-- vim-matchup plugin, uses treesitter
-- Do not show the not visible matching context on statusline
vim.g.matchup_matchparen_offscreen = {}

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

spellsitter.setup({
  hl = 'SpellBad',
  captures = { 'comment', 'string' },
})

gps.setup({
  separator = ' › ',
  icons = {
    ['class-name'] = ' ',
    ['container-name'] = ' ',
    ['function-name'] = ' ',
    ['method-name'] = ' ',
    ['tag-name'] = ' ',
  },
  languages = {
    ruby = {
      icons = {
        ['class-name'] = '::',
        ['container-name'] = '::',
        ['function-name'] = '.',
        ['method-name'] = '#',
        ['tag-name'] = '',
      },
      separator = '',
    },
  },
})

vim.my.treesitter = {
  gps = {
    location = function()
      if gps.is_available() then
        return gps.get_location()
      else
        return ''
      end
    end,
  },
}

command('-bang TSGPSLocation lua print(vim.my.treesitter.gps.location())')
command('-bang TSGPSLocationCopy lua vim.my.utils.to_clipboard(vim.my.treesitter.gps.location(), "<bang>")')
