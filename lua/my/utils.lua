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
  vim.cmd('command! '..args)
end

local keymap_default_opts = function(opts)
  opts = opts or {}
  setmetatable(opts, { __index = {
    noremap = true,
    silent = true
  }})
  return opts
end

M.keymap = function(mode, lhs, rhs, opts)
  vim.api.nvim_set_keymap(mode, lhs, rhs, keymap_default_opts(opts))
end

M.lua_keymap = function(mode, lhs, rhs)
  M.keymap(mode, lhs, '<cmd>lua '..rhs..'<cr>')
end

M.buf_keymap = function(buffer, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, keymap_default_opts(opts))
end

M.lua_buf_keymap = function(buffer, mode, lhs, rhs)
  M.buf_keymap(buffer, mode, lhs, '<cmd>lua '..rhs..'<cr>')
end

M.preserve = function(fn)
  local position = vim.api.nvim_win_get_cursor(0)
  fn()
  pcall(vim.api.nvim_win_set_cursor, 0, position)
end

M.highlight = function(opts)
  local text = ''
  if type(opts) == 'string' then
    text = opts
  elseif opts.current then
    text = vim.fn.expand('<cword>')
  end

  text = vim.fn.escape(text, ' *^$./[]')
  vim.fn.setreg('/', text)

  vim.api.nvim_set_vvar('hlsearch', 1)
  vim.opt.hlsearch = true
end

M.clean_buffers_and_windows = function ()
  R('my.windows').delete_orphan_floating()
  R('my.buffers').delete_unloaded()
end

M.fileicon = function(filetype, filename)
  local filetype_extensions = {
    ruby = 'rb',
    sh = 'sh',
    bash = 'bash',
    zsh = 'zsh'
  }

  local extension = filetype_extensions[filetype] or vim.fn.fnamemodify(filename, ':e')

  return R('nvim-web-devicons').get_icon(filename, extension, { default = true })
end

return M
