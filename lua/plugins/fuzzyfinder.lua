local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local dash = require('dash')

local utils = vim.my.utils

telescope.setup({
  extensions = {
    dash = {
      file_type_keywords = {
        NvimTree = false,
        TelescopePrompt = false,
        dashboard = false,
        packer = false,
        terminal = false,
      },
    },
    fzf = {
      case_mode = 'smart_case',
      fuzzy = true,
      override_file_sorter = true,
      override_generic_sorter = true,
    },
  },

  defaults = {
    dynamic_preview_title = true,
    layout_config = {
      prompt_position = 'top',
      flex = {
        flip_columns = 250,
        flip_lines = 50,
        vertical = {
          height = 0.99,
          width = 0.7,
          mirror = true,
        },
        horizontal = {
          height = 0.99,
          width = 0.99,
          mirror = false,
        },
      },
    },
    layout_strategy = 'flex',
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-n>'] = actions.cycle_history_next,
        ['<C-p>'] = actions.cycle_history_prev,
        ['<C-u>'] = { '<c-u>', type = 'command' }, -- delete inputted text
      },
    },
    path_display = { 'smart' },
    preview_title = '',
    prompt_prefix = '› ',
    selection_caret = '› ',
    set_env = { ['COLORTERM'] = 'truecolor' },
    sorting_strategy = 'ascending',
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    winblend = 0,
  },
})

telescope.load_extension('fzf')
telescope.load_extension('dash')

vim.my.fuzzyfinder = {
  find_files = function()
    builtin.find_files({ find_command = { 'files' } })
  end,
  git_files = builtin.git_files,
  grep_string = builtin.grep_string,
  grep_selected = function()
    builtin.grep_string({ search = utils.selected_text() })
  end,
  live_grep = builtin.live_grep,
  buffers = builtin.buffers,
  current_buffer_fuzzy_find = builtin.current_buffer_fuzzy_find,
  oldfiles = builtin.oldfiles,
  treesitter = builtin.treesitter,
  help_tags = builtin.help_tags,
  builtin = function()
    builtin.builtin({ previewer = false })
  end,
  dash = function()
    dash.search('!')
  end,
  lsp = {
    document_diagnostics = builtin.lsp_document_diagnostics,
    code_actions = builtin.lsp_code_actions,
  }
}

utils.lua_keymap('n', 'f<c-f>', 'vim.my.fuzzyfinder.builtin()')
utils.lua_keymap('n', 'f<c-p>', 'vim.my.fuzzyfinder.find_files()')
utils.lua_keymap('n', 'f<c-g>', 'vim.my.fuzzyfinder.git_files()')
utils.lua_keymap('n', 'f<c-o>', 'vim.my.fuzzyfinder.oldfiles()')
utils.lua_keymap('n', 'f<c-h>', 'vim.my.fuzzyfinder.help_tags()')
utils.lua_keymap('n', 'f<c-n>', 'vim.my.fuzzyfinder.current_buffer_fuzzy_find()')
utils.lua_keymap('n', 'f<c-t>', 'vim.my.fuzzyfinder.treesitter()')
utils.lua_keymap('n', 'f<c-k>', 'vim.my.fuzzyfinder.buffers()')
utils.lua_keymap('n', 'f<c-y>', 'vim.my.fuzzyfinder.live_grep()')
utils.lua_keymap('n', 'f<c-d>', 'vim.my.fuzzyfinder.dash()')

utils.lua_keymap('n', 'f<c-l>a', 'vim.my.fuzzyfinder.lsp.code_actions()')

utils.lua_keymap('n', '<leader>as', 'vim.my.fuzzyfinder.grep_string()')
utils.lua_keymap('v', '<leader>as', 'vim.my.fuzzyfinder.grep_selected()')

utils.command(string.format(
  '-nargs=1 Grep lua vim.my.fuzzyfinder.grep_string(%s)',
  vim.inspect({
    search = '<args>',
    prompt_title = 'Searching: "<args>"',
  }, { newline = '', indent = '' })
))

utils.augroup('user:fuzzyfinder', {
  { 'User', 'TelescopePreviewerLoaded', 'setlocal wrap number numberwidth=5' },
})
