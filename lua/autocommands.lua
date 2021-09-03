vim.my.utils.augroup('user:autocommands', {
  { 'BufWritePre,FileWritePre', '*', 'lua vim.my.buffers.trim()' },

  { 'WinLeave,FocusLost', '*', 'lua vim.my.buffers.autosave()' }
})
