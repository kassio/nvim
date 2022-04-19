local utils = require('my.utils')

local cmd = function(str)
  local cmd_str = vim.api.nvim_replace_termcodes(str, true, true, true)
  vim.cmd(cmd_str)
end

vim.api.nvim_buf_create_user_command(0, 'Sort', function()
  utils.preserve(function()
    cmd('normal ggV/^brew<CR>k:sort<CR>')
    cmd('normal gg/^brew<CR>V/^cask<CR>k:sort<CR>')
    cmd('normal gg/^cask<CR>V/^mas<CR>k:sort<CR>')
    cmd('normal gg/^mas<CR>VG:sort<CR>')
    cmd('write!')
  end)
end, {})
