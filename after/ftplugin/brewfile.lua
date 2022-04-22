local utils = require('my.utils')

local cmd = function(str)
  local cmd_str = vim.api.nvim_replace_termcodes(str, true, true, true)
  vim.cmd(cmd_str)
end

local brew_sort = function()
  utils.preserve(function()
    cmd('normal ggV/^brew<CR>k:sort<CR>')
    cmd('normal gg/^brew<CR>V/^cask<CR>k:sort<CR>')
    cmd('normal gg/^cask<CR>V/^mas<CR>k:sort<CR>')
    cmd('normal gg/^mas<CR>VG:sort<CR>')
    cmd('normal <c-l>')
    cmd('write!')
  end)
end

vim.api.nvim_buf_create_user_command(0, 'Sort', brew_sort, {})

vim.my.utils.augroup('user:autocommands', {
  {
    events = { 'BufWritePre', 'FileWritePre' },
    pattern = 'brewfile',
    callback = brew_sort,
  },
})
