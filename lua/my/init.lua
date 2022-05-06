require('my.table') -- global extension

vim.my = {}
vim.my.buffers = require('my.buffers')
vim.my.sessions = require('my.sessions')
vim.my.snippets = require('my.snippets')
vim.my.theme = require('my.theme')
vim.my.utils = require('my.utils')
vim.my.windows = require('my.windows')
vim.my.reloader = require('my.reloader')

require('my.options')
require('my.commands')
require('my.autocommands')
require('my.keymaps')
require('my.diagnostic')
