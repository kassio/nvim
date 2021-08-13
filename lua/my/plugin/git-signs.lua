local gitsigns = require'gitsigns'
local utils = require'my/utils'

gitsigns.setup{
  signs = {
    add = { hl = 'GitSignAdd', numhl = 'GitSignAddLineNr', text = '│' },
    change = { hl = 'GitSignChange', numhl = 'GitSignChangeLineNr', text = '│' },
    delete = { hl = 'GitSignDelete', numhl = 'GitSignDeleteLineNr', text = '│' },
    topdelete = { hl = 'GitSignDelete', numhl = 'GitSignDeleteLineNr', text = '‾' },
    changedelete = { hl = 'GitSignDelete', numhl = 'GitSignDeleteLineNr', text = '│' }
  },
  numhl = true,
  current_line_blame = false
}

utils.lua_keymap('n', '<leader>gm', [[require('gitsigns').toggle_current_line_blame()]])
