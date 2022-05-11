local theme = vim.my.theme
local colors = theme.colors
local hl_def = vim.my.utils.highlight_define
local hl_extend = vim.my.utils.highlight_extend
local sign_define = vim.my.utils.sign_define

vim.cmd('colorscheme ' .. vim.my.theme.colorscheme)

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

-- Diagnostics (vim.diagnostic)
-- Default highlight
hl_def('DiagnosticError', attrs({ foreground = colors.error }))
hl_def('DiagnosticWarn', attrs({ foreground = colors.warn }))
hl_def('DiagnosticInfo', attrs({ foreground = colors.info }))
hl_def('DiagnosticHint', attrs({ foreground = colors.hint }))

-- VirtualText
hl_def('DiagnosticVirtualTextError', attrs({ foreground = colors.light_error }))
hl_def('DiagnosticVirtualTextWarn', attrs({ foreground = colors.light_warn }))
hl_def('DiagnosticVirtualTextInfo', attrs({ foreground = colors.light_info }))
hl_def('DiagnosticVirtualTextHint', attrs({ foreground = colors.light_hint }))

-- Signs/Icons definition
sign_define('DiagnosticSignError', theme.signs.error, 'DiagnosticError')
sign_define('DiagnosticSignWarn', theme.signs.warn, 'DiagnosticWarn')
sign_define('DiagnosticSignInfo', theme.signs.info, 'DiagnosticInfo')
sign_define('DiagnosticSignHint', theme.signs.hint, 'DiagnosticHint')

-- Debugger
sign_define('DapBreakpoint', '●')
hl_def('DapBreakpoint', attrs({ foreground = colors.error }))

sign_define('DapBreakpointCondition', '◆')
hl_extend('DapBreakpointCondition', 'Number')

sign_define('DapLogPoint', 'Ξ')
hl_def('DapLogPoint', attrs({ foreground = colors.info }))

sign_define('DapStopped', '▶')
hl_def('DapStopped', attrs({ foreground = colors.hint }))

sign_define('DapBreakpointRejected', '◎')
hl_def('DapBreakpointRejected', attrs({ foreground = colors.warn }))

-- Git
hl_def(
  'GitSignsCurrentLineBlame',
  attrs({
    background = colors.shadow,
    foreground = colors.highlight,
    italic = true,
  })
)

hl_def('GitSignAdd', attrs({ foreground = colors.hint }))
hl_def('GitSignChange', attrs({ foreground = colors.warn }))
hl_def('GitSignDelete', attrs({ foreground = colors.error }))

hl_def('GitSignAddLineNr', attrs({ foreground = colors.hint }))
hl_def('GitSignChangeLineNr', attrs({ foreground = colors.warn }))
hl_def('GitSignDeleteLineNr', attrs({ foreground = colors.error }))

-- Spell
hl_def('SpellBad', attrs({ underdot = true, sp = colors.warn }))
hl_extend('SpellCap', 'SpellBad')
hl_extend('SpellRare', 'SpellBad')
hl_extend('SpellLocal', 'SpellBad')

-- Spacing/Visual clues
hl_def('ColorColumn', attrs({ background = colors.shadow }))
hl_extend('CursorLine', 'ColorColumn')

hl_def('NonText', attrs({ foreground = colors.highlight }))
hl_extend('Whitespace', 'NonText')

hl_def('VertSplit', { foreground = colors.highlight })
hl_def('SpecialKey', { foreground = colors.shadow })
hl_extend('SpecialChar', 'SpecialKey')
hl_extend('EndOfBuffer', 'SpecialKey')

-- Floating window
hl_def('NormalFloat', { background = colors.background })
hl_def('FloatShadow', { background = colors.shadow })

-- FloatingIdentifier
hl_def('FloatingIdentifierBufferNr', { foreground = colors.hint, background = colors.shadow })
hl_def('FloatingIdentifierBufferName', { foreground = colors.info, background = colors.shadow })

-- matching parantheses/blocks marks
hl_def('MatchParen', attrs({ bold = true }))

-- Filetree
hl_def('NvimTreeOpenedFile', attrs({ bold = true, italic = false, bg = colors.shadow }))

-- Treesitter
hl_def('TSCurrentScope', attrs({ background = colors.shadow }))

-- globals
hl_def('TSDefinition', attrs({ background = colors.shadow }))
hl_extend('TSDefinitionUsage', 'Normal')
hl_extend('TSTypeBuiltin', 'Type')
hl_extend('TSVariable', 'Normal')
hl_extend('TSParameter', 'Normal')
hl_extend('TSFuncBuiltin', 'Identifier')
hl_extend('TSStringEscape', 'String', { bold = true })
hl_extend('TSStringSpecial', 'String', { bold = true })

-- Ruby with Treesitter
hl_extend('rubyTSType', 'Type')
hl_extend('rubyTSLabel', 'Identifier')
hl_extend('rubyTSSymbol', 'Identifier')
hl_extend('rubyTSVariableBuiltin', 'Constant')

-- Go with Treesitter
hl_extend('goTSnamespace', 'Normal', { bold = true })
hl_extend('goTSvariable', 'Normal')
hl_extend('goTSfunction_name', 'Function')
hl_extend('goTSproperty', 'Function')

-- zsh
hl_extend('zshQuoted', 'String', { bold = true })
