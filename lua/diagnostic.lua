local lua_keymap = vim.my.utils.lua_keymap
local command = vim.my.utils.command

lua_keymap('n', 'glee', 'vim.diagnostic.open_float()')
lua_keymap('n', 'glea', 'vim.my.fuzzyfinder.lsp.document_diagnostics()')

command('DiagnosticsShow lua vim.diagnostic.show()')
command('DiagnosticsHide lua vim.diagnostic.hide()')
