vim.my.utils.augroup('user:autocommands', {
  {
    events = { 'BufWritePre', 'FileWritePre' },
    pattern = '*',
    callback = vim.my.buffers.trim,
  },
  {
    events = { 'WinLeave', 'FocusLost' },
    pattern = '*',
    callback = vim.my.buffers.autosave,
  },
})
