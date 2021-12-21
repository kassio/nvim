require('globals')

require('options') -- vim options
require('my') -- my plugins
require('commands')
require('autocommands')
require('keymaps')
require('diagnostic')

require('plugins').setup()
require('plugins.notification')
require('plugins.highlight')
require('plugins.tabline')
require('plugins.git')
require('plugins.filetree')
require('plugins.terminal')
require('plugins.test-runner')
require('plugins.fuzzyfinder')
require('plugins.treesitter')
require('plugins.completion')
require('plugins.lsp')
require('plugins.statusline')
