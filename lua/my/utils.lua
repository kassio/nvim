local M = {}
local api = vim.api
local fn = vim.fn

M.to_clipboard = function(text, use_external_clipboard)
  if use_external_clipboard then
    fn.setreg('*', text)
    print(string.format('"%s" copied to system clipboard', text))
  else
    fn.setreg('"', text)
    print(string.format('"%s" copied to clipboard', text))
  end
end

M.augroup = function(name, autocmds)
  local group = api.nvim_create_augroup(name, { clear = true })
  for _, opts in ipairs(autocmds) do
    local events = table.removekey(opts, 'events')
    opts['group'] = group
    api.nvim_create_autocmd(events, opts)
  end
end

M.cabbrev = function(lhs, rhs)
  vim.cmd(string.format('cabbrev %s %s', lhs, rhs))
end

M.preserve = function(callback)
  local saved_view = fn.winsaveview()
  callback()
  fn.winrestview(saved_view)
end

M.highlight_define = function(group, color)
  vim.api.nvim_set_hl(0, group, color)
end

M.highlight_extend = function(target, source, opts)
  local ok, source_hl = pcall(vim.api.nvim_get_hl_by_name, source, true)
  if not ok then
    P(string.format('Failed to find highlight by name "%s"', source))
    return
  end

  local exts = vim.tbl_extend('force', source_hl, opts or {})

  ok = pcall(M.highlight_define, target, exts)

  if not ok then
    P(
      string.format(
        'Failed to set highlight extension: source %s | target: %s | ext: %s ',
        source,
        target,
        vim.inspect(exts)
      )
    )
  end
end

M.sign_define = function(name, sign, highlight)
  fn.sign_define(name, { text = sign, texthl = highlight or name })
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

  return vim.fn.escape(table.concat(text, '\n'), ' *^$./\\[]')
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
    fn.setreg('h', text)

    if opts.sensitive_case then
      text = '\\C' .. text
    else
      text = '\\c' .. text
    end

    if opts.exclusive then
      text = '\\<' .. text .. '\\>'
    end

    fn.setreg('/', '\\V' .. text)

    api.nvim_set_vvar('hlsearch', 1)
    vim.opt.hlsearch = true
  end
end

M.fileicon = function(filetype, filename)
  local filetype_extensions = {
    go = 'go',
    ruby = 'rb',
    sh = 'sh',
    bash = 'bash',
    zsh = 'zsh',
  }

  local extension = filetype_extensions[filetype] or fn.fnamemodify(filename, ':e') or filetype

  return require('nvim-web-devicons').get_icon(filename, extension, { default = true })
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

M.copy_filename = function(cmd)
  local flag = ensure_valid_file_flag(cmd.args)
  local filename = fn.expand(flag)

  M.to_clipboard(filename, cmd.bang)
end

return M
