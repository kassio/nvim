local g = vim.g
local count_nkeymap = function(key, command)
  vim.my.utils.lua_keymap('n', key, 'vim.my.terminal.numbered_cmd("'..command..'")')
end

vim.my.terminal = {
  numbered_cmd = function(cmd)
    local number = vim.v.count
    if number == 0 then
      number = vim.b.neoterm_target or ""
    end

    vim.cmd(string.format(cmd, number))
  end
}

g.neoterm_default_mod = 'botright'
g.neoterm_automap_keys = '<leader>tm'
g.neoterm_use_relative_path = 1
g.neoterm_autoscroll = 1
g.neoterm_callbacks = {
  before_exec = function()
    vim.cmd('wall')
  end,
}

count_nkeymap('<leader>tt', '%sTtoggle')
count_nkeymap('<leader>vt', 'botright vertical %s Ttoggle')
count_nkeymap('<leader>ht', 'botright %s Ttoggle')
count_nkeymap('<leader>te', '%sT exit')
count_nkeymap('<leader>tl', '%sTclear')
count_nkeymap('<leader>tL', '%sTclear!')
count_nkeymap('<leader>tk', '%sTkill')

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
