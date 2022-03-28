require('plugins.fuzzyfinder.fzf')
require('plugins.fuzzyfinder.telescope')

local utils = vim.my.utils
local lua_keymap = utils.lua_keymap
local cmd_keymap = function(mode, map, cmd)
  utils.keymap(mode, map, '<cmd>' .. cmd .. '<cr>')
end

cmd_keymap('n', 'f<c-i>', 'FuzzyGFiles')
cmd_keymap('n', 'f<c-p>', 'FuzzyFiles')
cmd_keymap('n', 'f<c-y>', 'FuzzyRg')
cmd_keymap('n', 'f<c-f>', 'Telescope builtin')
cmd_keymap('n', 'f<c-k>', 'Telescope buffers')
cmd_keymap('n', 'f<c-h>', 'Telescope help_tags')
cmd_keymap('n', 'f<c-l>', 'Telescope highlights')
cmd_keymap('n', 'f<c-m>', 'Telescope keymaps')
cmd_keymap('n', 'f<c-o>', 'Telescope oldfiles')
cmd_keymap('n', 'f<c-t>', 'Telescope treesitter')
cmd_keymap('n', 'f<c-u>', 'Telescope commands')
cmd_keymap('n', 'f<c-n>', 'Telescope current_buffer_fuzzy_find')

lua_keymap('n', '<leader>as', 'vim.my.fuzzyfinder.grep_selected()')
lua_keymap('v', '<leader>as', 'vim.my.fuzzyfinder.grep_selected()')

lua_keymap('n', '<leader>as', 'vim.my.fuzzyfinder.grep_string()')
lua_keymap('v', '<leader>as', 'vim.my.fuzzyfinder.grep_string()')

utils.augroup('user:fuzzyfinder', {
  { 'User', 'TelescopePreviewerLoaded', 'setlocal wrap number numberwidth=5' },
  { 'FileType', 'fzf', 'noremap <silent><buffer><nowait> <esc> :<c-u>quit!<cr>' },
  { 'FileType', 'fzf', 'set signcolumn=no' },
  { 'BufLeave', 'fzf', 'q!' },
})
