local keymap = vim.my.utils.keymap
local theme = vim.my.theme
local colorbuddy = require('colorbuddy')
local _Color, colors, Group, groups, _styles = colorbuddy.setup()

-- TODO: to be removed on nvim 6.0
-- Future defaults (https://github.com/neovim/neovim/pull/15401)
-- make Y behave like C and D
keymap('n', 'Y', 'y$')
-- make <c-l> clean the screen and highlights
keymap('n', '<c-l>', '<cmd>nohlsearch<bar>diffupdate<cr><c-l>')
-- undo breakpoint for <c-u>
keymap('i', '<c-u>', '<c-g>u<c-u>')
-- undo breakpoint for <c-w>
keymap('i', '<c-w>', '<c-g>u<c-w>')

local sign_define = function(name, sign)
  vim.cmd(string.format('sign define %s texthl=%s text=%s', name, name, sign))
end

-- TODO: To be removed on nvim 6.0
-- Fallback to vim.lsp.diagnostic (https://github.com/neovim/neovim/pull/15585)
-- Default highlight
Group.new('LspDiagnosticsDefaultError', colors.myError, colors.none)
Group.new('LspDiagnosticsDefaultWarning', colors.myWarn, colors.none)
Group.new('LspDiagnosticsDefaultInformation', colors.myInfo, colors.none)
Group.new('LspDiagnosticsDefaultHint', colors.myHint, colors.none)
-- Signs/Icons highlight
Group.link('LspDiagnosticsSignError', groups.DiagnosticError)
Group.link('LspDiagnosticsSignWarning', groups.DiagnosticWarn)
Group.link('LspDiagnosticsSignInformation', groups.DiagnosticInfo)
Group.link('LspDiagnosticsSignHint', groups.DiagnosticHint)
-- Signs/Icons definition
sign_define('LspDiagnosticsSignError', theme.signs.error)
sign_define('LspDiagnosticsSignWarning', theme.signs.warn)
sign_define('LspDiagnosticsSignInformation', theme.signs.info)
sign_define('LspDiagnosticsSignHint', theme.signs.hint)
