local telescope = R('telescope')
local actions = R('telescope.actions')
local builtin = R('telescope.builtin')
local dash = R('dash')

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
    borderchars = {
      prompt =  { '─', '│', ' ', '│', '┌', '┬', '│', '│' },
      results = { '─', '│', '─', '│', '├', '┤', '┴', '└' },
      preview = { '─', '│', '─', ' ', '─', '┐', '┘', '─' },
    },
    dynamic_preview_title = true,
    layout_config = { prompt_position = 'top' },
    layout_strategy = 'horizontal',
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-u>'] = { '<c-u>', type = 'command' }, -- delete inputted text
        ['<C-p>'] = actions.cycle_history_prev,
        ['<C-n>'] = actions.cycle_history_next,
      },
    },
    path_display = { 'smart' },
    preview_title = '',
    prompt_prefix = '› ',
    selection_caret = '› ',
    set_env = { ['COLORTERM'] = 'truecolor' },
    sorting_strategy = 'ascending',
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

utils.lua_keymap('n', '<leader>as', 'vim.my.fuzzyfinder.grep_string()')
utils.lua_keymap('v', '<leader>as', 'vim.my.fuzzyfinder.grep_selected()')

utils.command(string.format(
  '-nargs=1 Grep lua vim.my.fuzzyfinder.grep_string(%s)',
  vim.inspect({
    search = '<args>',
    prompt_title = 'Searching: "<args>"',
  }, { newline = '', indent = '' })
))
