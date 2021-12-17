local command = vim.my.utils.command
local cabbrev = vim.my.utils.cabbrev

-- reload config
command('Reload lua vim.my.reload()')

-- trim the file
command('Trim lua vim.my.buffers.trim()')

-- Ensure path exists and writes the file
command('Write lua vim.my.buffers.ensure_path_and_write()')

-- copy filename
command('-bang -nargs=? CopyFilename lua vim.my.utils.copy_filename("<bang>", "<args>")')

-- session management
command('-nargs=? SessionSave lua vim.my.sessions.save("<args>")')
command('SessionLoad lua vim.my.sessions.load()')
command('SessionDestroy lua vim.my.sessions.destroy()')
command('SessionDestroyAll lua vim.my.sessions.destroy_all()')

-- Work aroud to quit neovim with wq and x
-- when a terminal is opened
command('Z w | qa')
cabbrev('wqa', 'Z')
cabbrev('xa', 'Z')
