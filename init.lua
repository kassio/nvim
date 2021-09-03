require('globals')

-- Ensure to have packer installed

R('my')
R('options')
R('theme')
R('commands')
R('autocommands')
R('keymaps')

R('plugins').setup()
R('plugins.statusline')
R('plugins.tabline')
R('plugins.colorizer')
R('plugins.git')
R('plugins.fuzzyfinder')
R('plugins.filetree')
R('plugins.treesitter')
R('plugins.lsp')
R('plugins.snippets')
R('plugins.completion')
R('plugins.terminal')
R('plugins.test-runner')
