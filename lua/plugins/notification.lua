local notify = require('notify')
local theme = vim.my.theme

require('notify').setup({
  timeout = 1250,
  icons = {
    ERROR = theme.signs.error,
    WARN = theme.signs.warn,
    INFO = theme.signs.info,
    DEBUG = theme.signs.bug,
    TRACE = theme.signs.bug,
  },
  background_colour = theme.colors.background,
})

vim.notify = notify
