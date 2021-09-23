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

Color.new('myError', vim.my.colors.error)
Color.new('myWarn', vim.my.colors.warn)
Color.new('myInfo', vim.my.colors.info)
Color.new('myHint', vim.my.colors.hint)
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
Group.new('GitSignChange', colors.myWarn, colors.none)
Group.new('GitSignDelete', colors.myError, colors.none)

Group.new('GitSignAddLineNr', colors.myHint:light(), colors.none)
Group.new('GitSignChangeLineNr', colors.myWarn:light(), colors.none)
Group.new('GitSignDeleteLineNr', colors.myError:light(), colors.none)

Group.new('TSDefinition', colors.none, colors.myShadow:dark())
Group.link('TSDefinitionUsage', groups.TSDefinition)

Group.new('DiagnosticSignError', colors.myError, colors.none)
Group.new('DiagnosticSignWarn', colors.myWarn, colors.none)
Group.new('DiagnosticSignInfo', colors.myInfo, colors.none)
Group.new('DiagnosticSignHint', colors.myHint, colors.none)

Group.new('MatchParen', colors.none, colors.none, styles.bold)

sign_define('DiagnosticSignError', vim.my.signs.error)
sign_define('DiagnosticSignWarn', vim.my.signs.warn)
sign_define('DiagnosticSignInfo', vim.my.signs.info)
sign_define('DiagnosticSignHint', vim.my.signs.hint)
