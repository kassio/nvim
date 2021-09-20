local keymap = vim.my.utils.keymap
local g = vim.g

g['test#strategy'] = 'neoterm'
g['test#go#gotest#executable'] = 'go test -v'

keymap('n', '<leader>ta', ':TestSuite<cr>')
keymap('n', '<leader>tf', ':TestFile<cr>')
keymap('n', '<leader>tc', ':TestNearest<cr>')
keymap('n', '<leader>tr', ':TestLast<cr>')

vim.my.test_runner = {
  rspec = function()
    vim.g['test#last_position'] = {
      file = 'spec/models/file_spec.rb',
      col = 1,
      line = 1,
    }

    vim.cmd('TestSuite')
  end,
}

vim.my.utils.command('RSpec lua vim.my.test_runner.rspec()')
vim.cmd('cabbrev Rspec RSpec')
