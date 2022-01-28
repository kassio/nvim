local utils = vim.my.utils

vim.g.fzf_command_prefix = 'Fuzzy'
vim.g.fzf_history_dir = '~/.fzf-history'
vim.g.fzf_buffers_jump = 1
vim.g.fzf_layout = {
  window = {
    width = 0.95,
    height = 0.7,
    relative = false,
    yoffset = 0,
    border = 'rounded',
  },
}
vim.g.fzf_preview_window = { 'right:60%', 'ctrl-/' }
vim.g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit',
}

local cmd_keymap = function(mode, map, cmd)
  utils.keymap(mode, map, '<cmd>' .. cmd .. '<cr>')
end

local oldfiles_list = function()
  local ignore = { 'fugitive:', '^/tmp', '^/private/tmp', '.git$', 'term:' }
  local files = vim.deepcopy(vim.v['oldfiles'] or {})

  return vim.tbl_filter(function(filename)
    local include = true
    for _, pattern in ipairs(ignore) do
      if string.find(filename, pattern) ~= nil then
        include = false
        break
      end
    end

    return include
  end, files)
end

local M = {}
M.oldfiles = function()
  vim.fn['fzf#run'](vim.fn['fzf#wrap']('MRU', { source = oldfiles_list() }))
end

M.grep_selected = function()
  vim.cmd('Rg ' .. utils.selected_text())
end

M.grep_string = function()
  vim.cmd('Rg ' .. vim.fn.expand('<cword>'))
end

vim.my.fuzzyfinder = M

cmd_keymap('n', 'f<c-p>', 'FuzzyFiles')
cmd_keymap('n', 'f<c-f>', 'FuzzyFiles')
cmd_keymap('n', 'f<c-g>', 'FuzzyGFiles')
cmd_keymap('n', 'f<c-o>', 'FuzzyHistory')
cmd_keymap('n', 'f<c-h>', 'FuzzyHelptags')
cmd_keymap('n', 'f<c-n>', 'FuzzyBLines')
cmd_keymap('n', 'f<c-k>', 'FuzzyBuffers')
cmd_keymap('n', 'f<c-n>', 'FuzzyCommands')
cmd_keymap('n', 'f<c-m>', 'FuzzyMaps')
cmd_keymap('n', 'f<c-y>', 'FuzzyRg')

utils.lua_keymap('n', 'f<c-o>', 'vim.my.fuzzyfinder.oldfiles()')
utils.lua_keymap('n', '<leader>as', 'vim.my.fuzzyfinder.grep_selected()')
utils.lua_keymap('n', '<leader>as', 'vim.my.fuzzyfinder.grep_string()')
utils.lua_keymap('v', '<leader>as', 'vim.my.fuzzyfinder.grep_string()')

utils.augroup('user:fuzzyfinder', {
  { 'FileType', 'fzf', 'noremap <silent><buffer><nowait> <esc> :<c-u>quit!<cr>' },
  { 'FileType', 'fzf', 'set signcolumn=no' },
  { 'BufLeave', 'fzf', 'q!' },
})
