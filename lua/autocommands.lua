vim.my.utils.augroup('user:autocommands', {
  { 'BufReadPost', '*', 'lua vim.my.buffers.restore_cursor_position()' },

  { 'BufWritePre,FileWritePre', '*', 'lua vim.my.buffers.trim()' },

  { 'WinLeave,FocusLost', '*', 'lua vim.my.buffers.autosave()' },
})
