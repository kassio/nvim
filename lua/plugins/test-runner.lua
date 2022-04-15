local keymap = vim.keymap.set
local g = vim.g

g['test#strategy'] = 'neoterm'
g['test#go#gotest#executable'] = 'GOFLAGS="-count=1" go test -v'

keymap('n', '<leader>ta', ':Tclear | TestSuite<cr>')
keymap('n', '<leader>tf', ':Tclear | TestFile<cr>')
keymap('n', '<leader>tc', ':Tclear | TestNearest<cr>')
keymap('n', '<leader>tr', ':Tclear | TestLast<cr>')

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

vim.api.nvim_create_user_command('RSpec', vim.my.test_runner.rspec, {})
vim.cmd('cabbrev Rspec RSpec')
