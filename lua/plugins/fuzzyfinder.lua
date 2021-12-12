local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local utils = vim.my.utils

telescope.setup({
  extensions = {
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
      n = {
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
      '--smart-case',
    },
    winblend = 0,
  },
})

telescope.load_extension('fzf')

vim.my.fuzzyfinder = {
  buffers = builtin.buffers,
  current_buffer_fuzzy_find = builtin.current_buffer_fuzzy_find,
  git_files = builtin.git_files,
  help_tags = builtin.help_tags,
  live_grep = builtin.live_grep,
  oldfiles = builtin.oldfiles,
  treesitter = builtin.treesitter,
  lsp = {
    document_diagnostics = function()
      builtin.diagnostics({ bufnr = 0 })
    end,
    code_actions = builtin.lsp_code_actions,
  },
}

vim.my.fuzzyfinder.find_files = function()
  builtin.find_files({ find_command = { 'files' } })
end

vim.my.fuzzyfinder.grep_string = function(opts)
  opts = opts or {}
  builtin.grep_string(vim.tbl_extend('keep', opts, { word_match = '-w', only_sort_text = true }))
end

vim.my.fuzzyfinder.grep_selected = function()
  vim.my.fuzzyfinder.grep_string({ search = utils.selected_text() })
end

vim.my.fuzzyfinder.builtin = function()
  builtin.builtin({ previewer = false })
end

utils.lua_keymap('n', 'f<c-f>', 'vim.my.fuzzyfinder.builtin()')
utils.lua_keymap('n', 'f<c-p>', 'vim.my.fuzzyfinder.find_files()')
utils.lua_keymap('n', 'f<c-g>', 'vim.my.fuzzyfinder.git_files()')
utils.lua_keymap('n', 'f<c-o>', 'vim.my.fuzzyfinder.oldfiles()')
utils.lua_keymap('n', 'f<c-h>', 'vim.my.fuzzyfinder.help_tags()')
utils.lua_keymap('n', 'f<c-n>', 'vim.my.fuzzyfinder.current_buffer_fuzzy_find()')
utils.lua_keymap('n', 'f<c-t>', 'vim.my.fuzzyfinder.treesitter()')
utils.lua_keymap('n', 'f<c-k>', 'vim.my.fuzzyfinder.buffers()')
utils.lua_keymap('n', 'f<c-y>', 'vim.my.fuzzyfinder.live_grep()')

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
