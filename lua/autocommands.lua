vim.my.utils.augroup('user:autocommands', {
  {
    events = { 'BufReadPost' },
    pattern = '*',
    callback = vim.my.buffers.restore_cursor_position,
  },
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
  {
    events = { 'WinLeave' },
    pattern = '*',
    command = 'set nocursorline',
  },
  {
    events = { 'WinEnter' },
    pattern = '*',
    command = 'set cursorline',
  },
})
