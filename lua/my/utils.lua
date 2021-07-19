local devicons = require'nvim-web-devicons'
local fn = vim.fn
local M = {}

local cmd = vim.cmd

M.augroup = function(name, autocmds)
  cmd('augroup ' .. name)
  cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
    cmd('autocmd ' .. table.concat(autocmd, ' '))
  end
  cmd('augroup END')
end

M.command = function(args)
  cmd("command! "..args)
end

M.keymap = function(mode, lhs, rhs, opts)
  opts = opts or {}
  setmetatable(opts, { __index = {
    noremap = true,
    silent = true
  }})

  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

M.lua_keymap = function(mode, lhs, rhs, opts)
  M.keymap('n', lhs, '<cmd>lua '..rhs..'<cr>')
end

M.buf_keymap = function(buf, mode, lhs, rhs, opts)
  opts = opts or {}
  setmetatable(opts, { __index = {
    noremap = true,
    silent = true
  }})

  vim.api.nvim_buf_set_keymap(buf, mode, lhs, rhs, opts)
end

M.lua_buf_keymap = function(buf, mode, lhs, rhs, opts)
  M.buf_keymap(buf, mode, lhs, '<cmd>lua '..rhs..'<cr>')
end

M.fileicon = function(filetype, filename)
  local filetype_extensions = {
    ruby = 'rb',
    sh = 'sh',
    bash = 'bash',
    zsh = 'zsh'
  }

  local extension =  filetype_extensions[filetype] or fn.fnamemodify(filename, ':e')

  return devicons.get_icon(filename, extension, { default = true })
end

M.upgrade = function()
  require('my/plugin').sync()
  require('my/plugin/lspinstall').installAll()
end

return M
