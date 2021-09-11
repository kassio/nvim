local command = vim.my.utils.command

-- Reload config
command('Reload lua vim.my.reload()')

-- Trim the file
command('Trim lua vim.my.buffers.trim()')

-- Copy filename
command('-bang CopyFilename lua vim.my.utils.copy_filename("<bang>")')
