local command = vim.api.nvim_create_user_command
local cabbrev = vim.my.utils.cabbrev

-- reload config
command('Reload', vim.my.reloader.reload, {})

-- trim the file
command('Trim', vim.my.buffers.trim, {})

-- Ensure path exists and writes the file
command('Write', vim.my.buffers.ensure_path_and_write, {})

-- copy filename
command('CopyFilename', vim.my.utils.copy_filename, { bang = true, nargs = '?' })

-- session management
command('SessionSave', vim.my.sessions.save, { nargs = '?' })
command('SessionLoad', vim.my.sessions.load, {})
command('SessionDestroy', vim.my.sessions.destroy, {})
command('SessionDestroyAll', vim.my.sessions.destroy_all, {})

-- Work aroud to quit neovim with wq and x
-- when a terminal is opened
command('Z', 'w | qa', {})
cabbrev('wqa', 'Z')
cabbrev('xa', 'Z')
