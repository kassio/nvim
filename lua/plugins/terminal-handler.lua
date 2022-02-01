-- fix terminal colors
-- Have to be called here to avoid conflict with my configs
require('terminal').setup()

local g = vim.g
local count_nkeymap = function(key, command)
  vim.my.utils.lua_keymap('n', key, 'vim.my.terminal.numbered_cmd("' .. command .. '")')
end

vim.my.terminal = {
  numbered_cmd = function(cmd)
    local number = vim.v.count
    if number == 0 then
      number = vim.b.neoterm_target or ''
    end

    vim.cmd(string.gsub(cmd, '{{target}}', number))
  end,
}

g.neoterm_default_mod = 'botright'
g.neoterm_automap_keys = '<leader>tm'
g.neoterm_use_relative_path = 1
g.neoterm_autoscroll = 1
g.neoterm_fixedsize = 1
g.neoterm_callbacks = {
  before_exec = function()
    vim.cmd('wall')
  end,
  before_create_window = function(instance)
    if string.match(instance.mod, 'vert') == nil then
      local height = vim.fn.winheight('.')
      g.neoterm_size = math.floor(height / 3)
    else
      g.neoterm_size = ''
    end

    return instance
  end,
}

vim.my.utils.keymap('n', '<leader>tg', ':Tredo<cr>')

count_nkeymap('<leader>tt', '{{target}}Ttoggle')
count_nkeymap('<leader>vt', 'botright vertical {{target}} Ttoggle')
count_nkeymap('<leader>ht', 'botright {{target}} Ttoggle')
count_nkeymap('<leader>te', '{{target}}T exit')
count_nkeymap('<leader>tl', '{{target}}Tclear')
count_nkeymap('<leader>tL', '{{target}}Tclear!')
count_nkeymap('<leader>tk', '{{target}}Tkill')

local options = {
  'nonumber',
  'scrolloff=0',
  'norelativenumber',
  'nocursorline',
  'bufhidden=hide',
}

vim.my.utils.augroup('user:terminal', {
  { 'TermOpen', '*', 'setlocal ' .. table.concat(options, ' ') },
})
