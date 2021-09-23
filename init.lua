require('globals')

R('options') -- vim options
R('my') -- my plugins
R('commands')
R('autocommands')
R('keymaps')

R('plugins').setup()
R('plugins.highlight')
R('plugins.tabline')
R('plugins.git')
R('plugins.filetree')
R('plugins.terminal')
R('plugins.test-runner')
R('plugins.fuzzyfinder')
R('plugins.treesitter')
R('plugins.completion')
R('plugins.lsp')
R('plugins.statusline')
