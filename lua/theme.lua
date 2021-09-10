vim.cmd('colorscheme palenight')

local cmd_options = function(cmd, args, opts)
  local arguments = table.concat(args, ' ')
  local options = ''
  for k, v in pairs(opts) do
    options = string.format('%s %s=%s', options, k, v)
  end

  vim.cmd(string.format('%s %s %s', cmd, arguments, options))
end

local hi = function(name, opts)
  cmd_options('hi!', { name }, opts)
end

local hi_link = function(lhs, rhs)
  vim.cmd(string.format('hi! link %s %s', lhs, rhs))
end

local sign_define = function(name, opts)
  cmd_options('sign define', { name }, opts)
end

hi('StatusError', { guifg = '#CA1243', gui = 'bold' })
hi('StatusWarning', { guifg = '#F7C154', gui = 'bold' })
hi('StatusInfo', { guifg = '#6699CC', gui = 'bold' })
hi('StatusSuccess', { guifg = '#50A14F', gui = 'bold' })
hi('StatusIgnore', { guifg = '#CCCCCC', gui = 'bold' })

hi('SpellBad', { guifg = 'NONE', guibg = 'NONE', gui = 'underline' })
hi_link('SpellCap', 'SpellBad')
hi_link('SpellRare', 'SpellBad')
hi_link('SpellLocal', 'SpellBad')

hi_link('LspDiagnosticsSignError', 'StatusError')
hi_link('LspDiagnosticsSignWarning', 'StatusWarning')
hi_link('LspDiagnosticsSignInformation', 'StatusInfo')
hi_link('LspDiagnosticsSignHint', 'StatusSuccess')

sign_define('LspDiagnosticsSignError', { texthl = 'LspDiagnosticsSignError', text = vim.g.sign_error })
sign_define('LspDiagnosticsSignWarning', { texthl = 'LspDiagnosticsSignWarning', text = vim.g.sign_warning })
sign_define('LspDiagnosticsSignInformation', { texthl = 'LspDiagnosticsSignInformation', text = vim.g.sign_info })
sign_define('LspDiagnosticsSignHint', { texthl = 'LspDiagnosticsSignHint', text = vim.g.sign_hint })
