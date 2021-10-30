local command = vim.my.utils.command
local cabbrev = vim.my.utils.cabbrev

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

-- Work aroud to quit neovim with wq and x
-- when a terminal is opened
command('Z w | qa')
cabbrev('wq', 'Z')
cabbrev('wqa', 'Z')
cabbrev('x', 'Z')
cabbrev('xa', 'Z')
