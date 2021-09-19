local command = vim.my.utils.command

-- reload config
command('Reload lua vim.my.reload()')

-- trim the file
command('Trim lua vim.my.buffers.trim()')

-- copy filename
command('-bang -nargs=? CopyFilename lua vim.my.utils.copy_filename("<bang>", "<args>")')

-- session management
command('-nargs=? SessionSave lua vim.my.sessions.save("<args>")')
command('SessionLoad lua vim.my.sessions.load()')
command('SessionDestroy lua vim.my.sessions.destroy()')
command('SessionDestroyAll lua vim.my.sessions.destroy_all()')

-- ruby specific
command('-bang RubyNamespace lua print(vim.my.ruby.namespace())')
command('-bang RubyNamespaceCopy lua vim.my.utils.to_clipboard(vim.my.ruby.namespace(), "<bang>")')
