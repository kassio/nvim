local g = vim.g
local fn = vim.fn
local utils = vim.my.utils

g.fzf_command_prefix = 'Fuzzy'
g.fzf_history_dir = '~/.fzf-history'
g.fzf_buffers_jump = 1
g.fzf_layout = {
  window = {
    width = 0.95,
    height = 0.7,
    relative = false,
    yoffset = 0,
    border = 'rounded',
  },
}
g.fzf_preview_window = { 'right:60%:+{2}-/2', 'ctrl-/' }
g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit',
}

local cmd_keymap = function(mode, map, cmd)
  utils.keymap(mode, map, '<cmd>' .. cmd .. '<cr>')
end

local fuzzy_grep = function(text)
  vim.cmd('FuzzyRg ' .. text)
end

vim.my.fuzzyfinder = {
  buffer_lines = function()
    local cmd = string.format(
      'rg --with-filename --column --line-number --no-heading --smart-case . %s',
      fn.fnameescape(fn.expand('%:p'))
    )

    local preview = fn['fzf#vim#with_preview']({
      options = '--layout reverse --with-nth=4.. --delimiter=":"',
    })

    fn['fzf#vim#grep'](cmd, 1, preview)
  end,
  grep_selected = function()
    fuzzy_grep(utils.selected_text())
  end,
  grep_string = function()
    fuzzy_grep(fn.expand('<cword>'))
  end,
  highlights = function()
    local text = vim.api.nvim_exec('highlight', true)

    fn['fzf#run'](fn['fzf#wrap']('Highlights', {
      source = vim.split(text, '\n'),
      sink = '',
    }))
  end,
}

cmd_keymap('n', 'f<c-h>', 'FuzzyHelptags')
cmd_keymap('n', 'f<c-i>', 'FuzzyGFiles')
cmd_keymap('n', 'f<c-k>', 'FuzzyBuffers')
cmd_keymap('n', 'f<c-m>', 'FuzzyMaps')
cmd_keymap('n', 'f<c-o>', 'FuzzyHistory')
cmd_keymap('n', 'f<c-o>', 'FuzzyHistory')
cmd_keymap('n', 'f<c-p>', 'FuzzyFiles')
cmd_keymap('n', 'f<c-u>', 'FuzzyCommands')
cmd_keymap('n', 'f<c-y>', 'FuzzyRg')

utils.lua_keymap('n', 'f<c-l>', 'vim.my.fuzzyfinder.highlights()')
utils.lua_keymap('n', 'f<c-n>', 'vim.my.fuzzyfinder.buffer_lines()')

utils.lua_keymap('n', '<leader>as', 'vim.my.fuzzyfinder.grep_selected()')
utils.lua_keymap('n', '<leader>as', 'vim.my.fuzzyfinder.grep_string()')
utils.lua_keymap('v', '<leader>as', 'vim.my.fuzzyfinder.grep_string()')

utils.augroup('user:fuzzyfinder', {
  { 'FileType', 'fzf', 'noremap <silent><buffer><nowait> <esc> :<c-u>quit!<cr>' },
  { 'FileType', 'fzf', 'set signcolumn=no' },
  { 'BufLeave', 'fzf', 'q!' },
})
