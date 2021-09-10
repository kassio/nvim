local keymap = vim.my.utils.keymap
local g = vim.g

g['test#strategy'] = 'neoterm'
g['test#go#gotest#executable'] = 'go test -v'

keymap('n', '<leader>ta', ':TestSuite<cr>')
keymap('n', '<leader>tf', ':TestFile<cr>')
keymap('n', '<leader>tc', ':TestNearest<cr>')
keymap('n', '<leader>tr', ':TestLast<cr>')
