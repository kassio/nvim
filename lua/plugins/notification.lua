local notify = R('notify')

require('notify').setup({
  timeout = 1250,
  icons = {
    ERROR = vim.my.signs.error,
    WARN = vim.my.signs.warn,
    INFO = vim.my.signs.info,
    DEBUG = vim.my.signs.bug,
    TRACE = vim.my.signs.bug,
  },
  background_colour = vim.my.colors.background,
})

vim.notify = notify
