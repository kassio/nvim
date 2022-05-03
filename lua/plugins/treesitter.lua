local treesitter = require('nvim-treesitter.configs')
local spellsitter = require('spellsitter')
local gps = require('nvim-gps')

-- vim-matchup plugin, uses treesitter
-- Do not show the not visible matching context on statusline
vim.g.matchup_matchparen_offscreen = {}

treesitter.setup({
  ensure_installed = 'all',
  ignore_install = {
    'kotlin',
    'latex',
    'norg',
    'vala',
  },
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
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
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
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
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

vim.api.nvim_create_user_command('TSGPSLocation', function()
  print(vim.my.treesitter.gps.location())
end, {})
vim.api.nvim_create_user_command('TSGPSLocationCopy', function(cmd)
  vim.my.utils.to_clipboard(vim.my.treesitter.gps.location(), cmd.bang)
end, {})
