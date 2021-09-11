local telescope = R('telescope')
local actions = R('telescope.actions')
local builtin = R('telescope.builtin')
local utils = vim.my.utils

telescope.load_extension'fzy_native'

telescope.setup {
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  },
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-u>'] = { "<c-u>", type = "command" }
      }
    },
    layout_config = {
      prompt_position = 'top',
    },
    prompt_prefix = '› ',
    selection_caret = '› ',
    set_env = { ['COLORTERM'] = 'truecolor' },
    sorting_strategy = 'ascending',
    winblend = 0
  }
}

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
  builtin = builtin.builtin,
}

local nnoremap = function(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, '<cmd>lua '..rhs..'<cr>', {
    noremap = true,
    silent = true
  })
end

utils.lua_keymap('n', 'f<c-f>', 'vim.my.fuzzyfinder.builtin()')
utils.lua_keymap('n', 'f<c-p>', 'vim.my.fuzzyfinder.find_files()')
utils.lua_keymap('n', 'f<c-g>', 'vim.my.fuzzyfinder.git_files()')
utils.lua_keymap('n', 'f<c-o>', 'vim.my.fuzzyfinder.oldfiles()')
utils.lua_keymap('n', 'f<c-h>', 'vim.my.fuzzyfinder.highlights()')

utils.lua_keymap('n', 'f<c-n>', 'vim.my.fuzzyfinder.current_buffer_fuzzy_find()')
utils.lua_keymap('n', 'f<c-k>', 'vim.my.fuzzyfinder.buffers()')
utils.lua_keymap('n', 'f<c-y>', 'vim.my.fuzzyfinder.live_grep()')

utils.lua_keymap('n', '<leader>as', 'vim.my.fuzzyfinder.grep_string()')

vim.cmd(
  string.format(
    'command! -nargs=1 Grep lua vim.my.fuzzyfinder.grep_string(%s)',
    vim.inspect({
      search = '<args>',
      prompt_title = "Searching: '<args>'"
    }, { newline='', indent='' })
  )
)
