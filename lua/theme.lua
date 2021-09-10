vim.cmd('colorscheme palenight')

local hi = function(name, opts)
  local values = ''
  for k, v in pairs(opts) do
    values = string.format('%s %s=%s', values, k, v)
  end

  vim.cmd(string.format('hi! %s %s', name, values))
end

local hi_link = function(lhs, rhs)
  vim.cmd(string.format('hi! link %s %s', lhs, rhs))
end

hi('SpellBad', { guifg = 'NONE', guibg = 'NONE', gui = 'underline' })
hi_link('SpellCap', 'SpellBad')
hi_link('SpellRare', 'SpellBad')
hi_link('SpellLocal', 'SpellBad')
