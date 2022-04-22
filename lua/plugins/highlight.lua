local theme = vim.my.theme
local colors = theme.colors
local hl_def = vim.my.utils.highlight_define
local hl_extend = vim.my.utils.highlight_extend
local sign_define = vim.my.utils.sign_define

-- Highlight color strings
require('colorizer').setup()
-- Prettier quickfix/location list windows
require('pqf').setup({
  signs = {
    error = theme.signs.error,
    warning = theme.signs.warn,
    info = theme.signs.info,
    hint = theme.signs.hint,
  },
})

local attrs = function(opts)
  return vim.tbl_extend('keep', opts, {
    foreground = 'NONE',
    background = 'NONE',
    sp = 'NONE',
  })
end

-- let &t_Cs = "\e[4:3m"
-- let &t_Ce = "\e[4:0m"
-- hi SpellBad   guisp=#AB3434    gui=undercurl guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE term=underline cterm=undercurl ctermul=red
-- set spell spelllang=en_us termguicolors

vim.cmd('colorscheme ' .. theme.colorscheme)

-- Spell
hl_def('SpellBad', attrs({ underline = true, sp = colors.warn }))
hl_extend('SpellCap', 'SpellBad')
hl_extend('SpellRare', 'SpellBad')
hl_extend('SpellLocal', 'SpellBad')

-- Spacing/Visual clues
hl_def('ColorColumn', attrs({ background = colors.shadow }))

hl_def('NonText', attrs({ foreground = colors.shadow }))
hl_extend('Whitespace', 'NonText')

hl_def('VertSplit', { foreground = colors.ignore })
hl_def('SpecialKey', { foreground = colors.shadow })
hl_extend('SpecialChar', 'SpecialKey')
hl_extend('EndOfBuffer', 'SpecialKey')

-- matching parantheses/blocks marks
hl_def('MatchParen', attrs({ bold = true }))

-- Diagnostics (vim.diagnostic)
-- Default highlight
hl_def('DiagnosticError', attrs({ foreground = colors.error }))
hl_def('DiagnosticWarn', attrs({ foreground = colors.warn }))
hl_def('DiagnosticInfo', attrs({ foreground = colors.info }))
hl_def('DiagnosticHint', attrs({ foreground = colors.hint }))

-- Signs/Icons definition
sign_define('DiagnosticSignError', theme.signs.error, 'DiagnosticError')
sign_define('DiagnosticSignWarn', theme.signs.warn, 'DiagnosticWarn')
sign_define('DiagnosticSignInfo', theme.signs.info, 'DiagnosticInfo')
sign_define('DiagnosticSignHint', theme.signs.hint, 'DiagnosticHint')

-- Git
hl_def('GitSignsCurrentLineBlame', attrs({ foreground = colors.shadow, italic = true }))

hl_def('GitSignAdd', attrs({ foreground = colors.hint }))
hl_def('GitSignChange', attrs({ foreground = colors.warn }))
hl_def('GitSignDelete', attrs({ foreground = colors.error }))

hl_def('GitSignAddLineNr', attrs({ foreground = colors.hint }))
hl_def('GitSignChangeLineNr', attrs({ foreground = colors.warn }))
hl_def('GitSignDeleteLineNr', attrs({ foreground = colors.error }))

-- Filetree
hl_def('NvimTreeOpenedFile', attrs({ underline = true, sp = colors.info }))

-- Treesitter
hl_def('TSError', attrs({ undercurl = true, italic = true, sp = colors.error }))
-- globals
hl_def('TSDefinition', attrs({ background = colors.shadow }))
hl_extend('TSDefinitionUsage', 'TSDefinition')
hl_extend('TSTypeBuiltin', 'Type')
hl_extend('TSVariable', 'Normal')
hl_extend('TSParameter', 'Normal')
hl_extend('TSFuncBuiltin', 'Identifier')
hl_extend('TSStringEscape', 'TSString', { bold = true })
hl_extend('TSStringSpecial', 'TSString', { bold = true })

-- Ruby with Treesitter
hl_extend('rubyTSType', 'rubyconstant')
hl_extend('rubyTSLabel', 'rubyinstancevariable')
hl_extend('rubyTSSymbol', 'rubysymbol')
hl_extend('rubyTSVariableBuiltin', 'rubypseudovariable')

-- Go with Treesitter
hl_extend('goTSvariable', 'TSVariable')
hl_extend('goTSfunction_name', 'TSfunction')
hl_extend('goTSproperty', 'TSfunction')

-- zsh
hl_extend('zshQuoted', 'String', { bold = true })
