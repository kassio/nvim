local M = {}
local cmd = vim.cmd
local api = vim.api
local fn = vim.fn

M.augroup = function(name, autocmds)
  cmd('augroup ' .. name)
  cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
    cmd('autocmd ' .. table.concat(autocmd, ' '))
  end
  cmd('augroup END')
end

M.command = function(args)
  vim.cmd('command! ' .. args)
end

M.cabbrev = function(lhs, rhs)
  vim.cmd(string.format('cabbrev %s %s', lhs, rhs))
end

local keymap_default_opts = function(opts)
  return vim.tbl_extend('keep', opts or {}, {
    noremap = true,
    silent = true,
  })
end

M.keymap = function(mode, lhs, rhs, opts)
  api.nvim_set_keymap(mode, lhs, rhs, keymap_default_opts(opts))
end

M.lua_keymap = function(mode, lhs, rhs)
  M.keymap(mode, lhs, ':<c-u>silent lua ' .. rhs .. '<cr>')
end

M.buf_keymap = function(buffer, mode, lhs, rhs, opts)
  api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, keymap_default_opts(opts))
end

M.lua_buf_keymap = function(buffer, mode, lhs, rhs)
  M.buf_keymap(buffer, mode, lhs, ':<c-u>silent lua ' .. rhs .. '<cr>')
end

M.preserve = function(callback)
  local saved_view = fn.winsaveview()
  callback()
  fn.winrestview(saved_view)
end

local get_visual_region = function()
  local pos_start = api.nvim_buf_get_mark(0, '<')
  local pos_end = api.nvim_buf_get_mark(0, '>')
  local regtype = fn.visualmode()

  return vim.region(0, pos_start, pos_end, regtype, true)
end

M.selected_text = function()
  local text = {}
  local region = get_visual_region()
  local line_numbers = vim.tbl_keys(region)
  table.sort(line_numbers)

  for _, n in ipairs(line_numbers) do
    local portion = region[n]
    local line = fn.getline(n)

    table.insert(text, string.sub(line, portion[1] + 1, portion[2]))
  end

  return table.concat(text, '\n')
end

M.highlight = function(opts)
  opts = opts or {}

  local text = ''
  if type(opts) == 'string' then
    text = opts
  elseif opts.text then
    text = opts.text
  elseif opts.current then
    text = fn.expand('<cword>')
  elseif opts.selected then
    text = M.selected_text()
  end

  if #text > 0 then
    if opts.sensitive_case then
      text = '\\C' .. text
    else
      text = '\\c' .. text
    end

    if opts.exclusive then
      text = '\\<' .. text .. '\\>'
    end

    fn.setreg('/', '\\V' .. text, 'v')

    api.nvim_set_vvar('hlsearch', 1)
    vim.opt.hlsearch = true
  end
end

M.clean_buffers_and_windows = function()
  R('my.windows').delete_orphan_floating()
  R('my.buffers').delete_hidden()
  R('my.buffers').delete_unloaded()
end

M.fileicon = function(filetype, filename)
  local filetype_extensions = {
    ruby = 'rb',
    sh = 'sh',
    bash = 'bash',
    zsh = 'zsh',
  }

  local extension = filetype_extensions[filetype] or fn.fnamemodify(filename, ':e')

  return R('nvim-web-devicons').get_icon(filename, extension, { default = true })
end

local valid_flag = function(flag)
  return vim.tbl_contains({ 'p', 'h', 't', 'r', 'e', '.', '~' }, flag)
end

local ensure_valid_file_flag = function(flag)
  flag = string.gsub(string.lower(tostring(flag)), '[:%%]', '')
  if valid_flag(flag) then
    return '%:' .. flag
  else
    return '%:.'
  end
end

M.to_clipboard = function(text, external_clipboard)
  if #external_clipboard > 0 then
    fn.setreg('*', text)
    print(string.format('"%s" copied to system clipboard', text))
  else
    fn.setreg('"', text)
    print(string.format('"%s" copied to clipboard', text))
  end
end

M.copy_filename = function(external_clipboard, flag)
  flag = ensure_valid_file_flag(flag)
  local filename = fn.expand(flag)

  M.to_clipboard(filename, external_clipboard)
end

return M
