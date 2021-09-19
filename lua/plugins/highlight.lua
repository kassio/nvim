-- Highlight color strings
R('colorizer').setup()
-- Fix terminal colors
R('terminal').setup()
-- Color helpers
local colorbuddy = R('colorbuddy')
-- Highlight helpers
local Color, colors, Group, groups, styles = colorbuddy.setup()
-- Set theme
colorbuddy.colorscheme('onebuddy')

local sign_define = function(name, sign)
  vim.cmd(string.format('sign define %s texthl=%s text=%s', name, name, sign))
end

Color.new('myError', '#CA1243')
Color.new('myWarning', '#F7C154')
Color.new('myInformation', '#6699CC')
Color.new('myHint', '#50A14F')
Color.new('myIgnore', '#CCCCCC')
Color.new('myShadow', '#282E34')

-- Group.new = function(name, fg, bg, style, guisp, blend)
Group.new('SpellBad', colors.none, colors.none, styles.undercurl, colors.myError)
Group.link('SpellCap', groups.SpellBad)
Group.link('SpellRare', groups.SpellBad)
Group.link('SpellLocal', groups.SpellBad)

Group.new('ColorColumn', colors.none, colors.myShadow)

Group.new('NonText', colors.myShadow:light(), colors.none, styles.none)
Group.link('VertSplit', groups.NonText)
Group.link('Whitespace', groups.NonText)
Group.link('SpecialKey', groups.NonText)
Group.link('SpecialChar', groups.NonText)
Group.link('EndOfBuffer', groups.NonText)

Group.new('GitSignsCurrentLineBlame', colors.myShadow:light(), colors.none, styles.italic)

Group.new('GitSignAdd', colors.myHint, colors.none)
Group.new('GitSignChange', colors.myWarning, colors.none)
Group.new('GitSignDelete', colors.myError, colors.none)

Group.new('GitSignAddLineNr', colors.myHint:light(), colors.none)
Group.new('GitSignChangeLineNr', colors.myWarning:light(), colors.none)
Group.new('GitSignDeleteLineNr', colors.myError:light(), colors.none)

Group.new('TSDefinition', colors.none, colors.myShadow:dark())
Group.link('TSDefinitionUsage', groups.TSDefinition)

Group.new('LspDiagnosticsVirtualTextError', colors.myError:dark(), colors.none, styles.italic)
Group.new('LspDiagnosticsVirtualTextWarning', colors.myWarning:dark(), colors.none, styles.italic)
Group.new('LspDiagnosticsVirtualTextInformation', colors.myInformation:dark(), colors.none, styles.italic)
Group.new('LspDiagnosticsVirtualTextHint', colors.myHint:dark(), colors.none, styles.italic)

Group.new('LspDiagnosticsSignError', colors.myError, colors.none)
Group.new('LspDiagnosticsSignWarning', colors.myWarning, colors.none)
Group.new('LspDiagnosticsSignInformation', colors.myInformation, colors.none)
Group.new('LspDiagnosticsSignHint', colors.myHint, colors.none)

sign_define('LspDiagnosticsSignError', vim.my.signs.error)
sign_define('LspDiagnosticsSignWarning', vim.my.signs.warning)
sign_define('LspDiagnosticsSignInformation', vim.my.signs.info)
sign_define('LspDiagnosticsSignHint', vim.my.signs.hint)

sign_define('DiagnosticSignError', vim.my.signs.error)
sign_define('DiagnosticSignWarn', vim.my.signs.warning)
sign_define('DiagnosticSignInfo', vim.my.signs.info)
sign_define('DiagnosticSignHint', vim.my.signs.hint)
