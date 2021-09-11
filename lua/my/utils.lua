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

local valid_flag = function(flag)
  return vim.tbl_contains({ 'p', 'h', 't', 'r', 'e', '.', '~' }, flag)
end

local ensure_valid_file_flag = function(flag)
  flag = string.gsub(string.lower(tostring(flag)), '[:%%]', '')
  if valid_flag(flag) then
    return '%:'..flag
  else
    return '%:.'
  end
end

M.copy_filename = function(external_clipboard, flag)
  flag = ensure_valid_file_flag(flag)
  P{ final_flag = flag }
  local filename = vim.fn.expand(flag)

  if external_clipboard == '!' then
    vim.fn.setreg('*', filename)
    print(string.format('"%s" copied to system clipboard', filename))
  else
    vim.fn.setreg('"', filename)
    print(string.format('"%s" copied to clipboard', filename))
  end
end

return M
