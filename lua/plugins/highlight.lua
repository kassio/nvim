local theme = vim.my.theme

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

local sign_define = function(name, sign)
  vim.cmd(string.format('sign define %s texthl=%s text=%s', name, name, sign))
end

local hl_def = function(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

local hl_extend = function(target, source, exts)
  exts = exts or {}
  source_hl = vim.api.nvim_get_hl_by_name(source, true)

  local ok = pcall(hl_def, target, vim.tbl_extend('force', source_hl, exts))

  if not ok then
    P({ source, target, vim.tbl_extend('force', source_hl, exts) })
  end
end

vim.cmd('colorscheme ' .. theme.colorscheme)
vim.opt.background = vim.o.background

-- Spell
hl_def('SpellBad', { foreground = 'NONE', background = 'NONE', undercurl = true })
hl_extend('SpellCap', 'SpellBad')
hl_extend('SpellRare', 'SpellBad')
hl_extend('SpellLocal', 'SpellBad')

-- Spacing/Visual clues
hl_def('ColorColumn', { foreground = 'NONE', background = theme.colors.shadow })

hl_def('NonText', { foreground = theme.colors.shadow, background = 'NONE' })
hl_extend('Whitespace', 'NonText')

hl_def('VertSplit', { foreground = theme.colors.ignore })
hl_def('SpecialKey', { foreground = theme.colors.shadow })
hl_extend('SpecialChar', 'SpecialKey')
hl_extend('EndOfBuffer', 'SpecialKey')

-- matching parantheses/blocks marks
hl_def('MatchParen', { foreground = 'NONE', background = 'NONE', bold = true })

-- Diagnostics (vim.diagnostic)
-- Default highlight
hl_def('DiagnosticError', { foreground = theme.colors.error, background = 'NONE' })
hl_def('DiagnosticWarn', { foreground = theme.colors.warn, background = 'NONE' })
hl_def('DiagnosticInfo', { foreground = theme.colors.info, background = 'NONE' })
hl_def('DiagnosticHint', { foreground = theme.colors.hint, background = 'NONE' })

-- Signs/Icons highlight
hl_extend('DiagnosticSignError', 'DiagnosticError')
hl_extend('DiagnosticSignWarn', 'DiagnosticWarn')
hl_extend('DiagnosticSignInfo', 'DiagnosticInfo')
hl_extend('DiagnosticSignHint', 'DiagnosticHint')

-- Signs/Icons definition
sign_define('DiagnosticSignError', theme.signs.error)
sign_define('DiagnosticSignWarn', theme.signs.warn)
sign_define('DiagnosticSignInfo', theme.signs.info)
sign_define('DiagnosticSignHint', theme.signs.hint)

-- Default escape string
hl_extend('TSStringEscape', 'TSString', { bold = true })

-- Git
hl_def('GitSignsCurrentLineBlame', {
  foreground = theme.colors.shadow,
  background = 'NONE',
  italic = true,
})

hl_def('GitSignAdd', { foreground = theme.colors.hint, background = 'NONE' })
hl_def('GitSignChange', { foreground = theme.colors.warn, background = 'NONE' })
hl_def('GitSignDelete', { foreground = theme.colors.error, background = 'NONE' })

hl_def('GitSignAddLineNr', { foreground = theme.colors.hint, background = 'NONE' })
hl_def('GitSignChangeLineNr', { foreground = theme.colors.warn, background = 'NONE' })
hl_def('GitSignDeleteLineNr', { foreground = theme.colors.error, background = 'NONE' })

-- Filetree
hl_def('NvimTreeOpenedFile', { foreground = 'NONE', background = 'NONE', undercurl = true })

-- Treesitter
hl_def('TSDefinition', { foreground = 'NONE', background = theme.colors.shadow })
hl_extend('TSDefinitionUsage', 'TSDefinition')
hl_extend('TSTypeBuiltin', 'Type')
hl_extend('TSVariable', 'Normal')
hl_extend('TSParameter', 'Normal')
hl_extend('TSFuncBuiltin', 'Identifier')

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
