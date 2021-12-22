local theme = vim.my.theme

-- Highlight color strings
require('colorizer').setup()
-- Fix terminal colors
require('terminal').setup()
-- Prettier quickfix/location list windows
require('pqf').setup({
  signs = {
    error = theme.signs.error,
    warning = theme.signs.warn,
    info = theme.signs.info,
    hint = theme.signs.hint,
  },
})

-- Color helpers
local colorbuddy = require('colorbuddy')
-- Highlight helpers
local Color, colors, Group, groups, styles = colorbuddy.setup()
-- Set theme
colorbuddy.colorscheme('onebuddy', vim.o.background == 'light')

local sign_define = function(name, sign)
  vim.cmd(string.format('sign define %s texthl=%s text=%s', name, name, sign))
end

Color.new('myError', theme.colors.error)
Color.new('myWarn', theme.colors.warn)
Color.new('myInfo', theme.colors.info)
Color.new('myHint', theme.colors.hint)
Color.new('myIgnore', theme.colors.ignore)
Color.new('myShadow', theme.colors.shadow)
Color.new('myBackground', theme.colors.background)

-- Group.new = function(name, fg, bg, style, guisp, blend)
-- Spell
Group.new('SpellBad', colors.none, colors.none, styles.undercurl, colors.myError)
Group.link('SpellCap', groups.SpellBad)
Group.link('SpellRare', groups.SpellBad)
Group.link('SpellLocal', groups.SpellBad)

-- Spacing/Visual clues
Group.new('ColorColumn', colors.none, colors.myShadow)

Group.new('NonText', colors.myShadow:light(), colors.none, styles.none)
Group.link('Whitespace', groups.NonText)

Group.new('VertSplit', colors.myShadow)
Group.link('SpecialKey', groups.VertSplit)
Group.link('SpecialChar', groups.VertSplit)
Group.link('EndOfBuffer', groups.VertSplit)

Group.new('MatchParen', colors.none, colors.none, styles.bold)

-- Diagnostics (vim.diagnostic)
-- Default highlight
Group.new('DiagnosticError', colors.myError, colors.none)
Group.new('DiagnosticWarn', colors.myWarn, colors.none)
Group.new('DiagnosticInfo', colors.myInfo, colors.none)
Group.new('DiagnosticHint', colors.myHint, colors.none)
-- Signs/Icons highlight
Group.link('DiagnosticSignError', groups.DiagnosticError)
Group.link('DiagnosticSignWarn', groups.DiagnosticWarn)
Group.link('DiagnosticSignInfo', groups.DiagnosticInfo)
Group.link('DiagnosticSignHint', groups.DiagnosticHint)
-- Signs/Icons definition
sign_define('DiagnosticSignError', theme.signs.error)
sign_define('DiagnosticSignWarn', theme.signs.warn)
sign_define('DiagnosticSignInfo', theme.signs.info)
sign_define('DiagnosticSignHint', theme.signs.hint)

-- Git
Group.new('GitSignsCurrentLineBlame', colors.myShadow, colors.none, styles.italic)

Group.new('GitSignAdd', colors.myHint, colors.none)
Group.new('GitSignChange', colors.myWarn, colors.none)
Group.new('GitSignDelete', colors.myError, colors.none)

Group.new('GitSignAddLineNr', colors.myHint:light(), colors.none)
Group.new('GitSignChangeLineNr', colors.myWarn:light(), colors.none)
Group.new('GitSignDeleteLineNr', colors.myError:light(), colors.none)

-- Filetree
Group.new('NvimTreeOpenedFile', colors.none, colors.none, styles.undercurl)

-- Ruby with Treesitter
Group.link('rubyTSType', groups.rubyconstant)
Group.link('rubyTSLabel', groups.rubyinstancevariable)
Group.link('rubyTSSymbol', groups.rubysymbol)
Group.link('rubyTSVariableBuiltin', groups.rubypseudovariable)

-- Go with Treesitter
Group.link('goTSvariable', groups.TSVariable)
Group.link('goTSfunction_name', groups.TSfunction)
Group.link('goTSproperty', groups.TSfunction)

-- Treesitter
Group.new('TSDefinition', colors.none, colors.myShadow)
Group.link('TSDefinitionUsage', groups.TSDefinition)
Group.link('TSTypeBuiltin', groups.Type)
Group.link('TSVariable', groups.Normal)
Group.link('TSParameter', groups.Normal)
Group.link('TSFuncBuiltin', groups.Identifier)

-- zsh
Group.new('zshQuoted', groups.String, groups.String, styles.bold)
