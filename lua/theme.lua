local Color, colors, Group, groups, styles = require('colorbuddy').setup()

local sign_define = function(name, sign)
  vim.cmd(string.format('sign define %s texthl=%s text=%s', name, name, sign))
end

vim.cmd('colorscheme palenight')

Color.new('myError', '#CA1243')
Color.new('myWarning', '#F7C154')
Color.new('myInformation', '#6699CC')
Color.new('myHint', '#50A14F')
Color.new('myIgnore', '#CCCCCC')

-- Group.new = function(name, fg, bg, style, guisp, blend)
Group.new('SpellBad', colors.none, colors.none, styles.underline)
Group.link('SpellCap', groups.SpellBad)
Group.link('SpellRare', groups.SpellBad)
Group.link('SpellLocal', groups.SpellBad)

Group.new('LspDiagnosticsSignError', colors.myError, colors.none)
Group.new('LspDiagnosticsSignWarning', colors.myWarning, colors.none)
Group.new('LspDiagnosticsSignInformation', colors.myInformation, colors.none)
Group.new('LspDiagnosticsSignHint', colors.myHint, colors.none)

Group.new('LspDiagnosticsVirtualTextError', colors.myError:dark(), colors.none, styles.italic)
Group.new('LspDiagnosticsVirtualTextWarning', colors.myWarning:dark(), colors.none, styles.italic)
Group.new('LspDiagnosticsVirtualTextInformation', colors.myInformation:dark(), colors.none, styles.italic)
Group.new('LspDiagnosticsVirtualTextHint', colors.myHint:dark(), colors.none, styles.italic)

sign_define('LspDiagnosticsSignError', vim.my.signs.error)
sign_define('LspDiagnosticsSignWarning', vim.my.signs.warning)
sign_define('LspDiagnosticsSignInformation', vim.my.signs.info)
sign_define('LspDiagnosticsSignHint', vim.my.signs.hint)
