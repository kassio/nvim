local telescope = R('telescope')
local actions = R('telescope.actions')
local builtin = R('telescope.builtin')
local dash = R('dash')

local utils = vim.my.utils

telescope.setup({
  extensions = {
    dash = {
      file_type_keywords = {
        dashboard = false,
        NvimTree = false,
        TelescopePrompt = false,
        terminal = false,
        packer = false,
      },
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-u>'] = { '<c-u>', type = 'command' },
      },
    },
    layout_config = {
      prompt_position = 'top',
    },
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
  live_grep = builtin.live_grep,
  buffers = builtin.buffers,
  current_buffer_fuzzy_find = function()
    builtin.current_buffer_fuzzy_find(R('telescope.themes').get_dropdown())
  end,
  oldfiles = builtin.oldfiles,
  treesitter = builtin.treesitter,
  builtin = builtin.builtin,
  dash = function()
    dash.search('!')
  end
}

utils.lua_keymap('n', 'f<c-f>', 'vim.my.fuzzyfinder.builtin()')
utils.lua_keymap('n', 'f<c-p>', 'vim.my.fuzzyfinder.find_files()')
utils.lua_keymap('n', 'f<c-g>', 'vim.my.fuzzyfinder.git_files()')
utils.lua_keymap('n', 'f<c-o>', 'vim.my.fuzzyfinder.oldfiles()')
utils.lua_keymap('n', 'f<c-h>', 'vim.my.fuzzyfinder.highlights()')
utils.lua_keymap('n', 'f<c-n>', 'vim.my.fuzzyfinder.current_buffer_fuzzy_find()')
utils.lua_keymap('n', 'f<c-t>', 'vim.my.fuzzyfinder.treesitter()')
utils.lua_keymap('n', 'f<c-k>', 'vim.my.fuzzyfinder.buffers()')
utils.lua_keymap('n', 'f<c-y>', 'vim.my.fuzzyfinder.live_grep()')
utils.lua_keymap('n', 'f<c-d>', 'vim.my.fuzzyfinder.dash()')

utils.lua_keymap('n', '<leader>as', 'vim.my.fuzzyfinder.grep_string()')

utils.command(string.format(
  '-nargs=1 Grep lua vim.my.fuzzyfinder.grep_string(%s)',
  vim.inspect({
    search = '<args>',
    prompt_title = "Searching: '<args>'",
  }, { newline = '', indent = '' })
))
