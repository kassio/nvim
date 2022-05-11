local M = {}
local api = vim.api

local name = 'FloatingIdentifier'
local prefix = function(txt)
  return name .. txt
end

local hlnamespace = api.nvim_create_namespace(name)
local add_highlight = function(bufid, hlname, col_start, col_end)
  api.nvim_buf_add_highlight(bufid, hlnamespace, hlname, 0, col_start, col_end)
end

M.show = function(reference_window)
  reference_window = reference_window or api.nvim_get_current_win()

  local rbufid = api.nvim_win_get_buf(reference_window)
  if api.nvim_buf_get_option(rbufid, 'buftype') ~= '' then
    return
  end

  local fbufid = api.nvim_create_buf(false, true)
  api.nvim_buf_set_option(fbufid, 'filetype', name)

  local bufname = api.nvim_buf_get_name(rbufid)
  if bufname == '' then
    return
  end

  local identifier_bufnr = string.format(' %d ', rbufid)
  local identifier_bufname = string.format(' %s ', vim.fn.fnamemodify(bufname, ':~:.'))
  local identifier = identifier_bufnr .. identifier_bufname
  local width = api.nvim_win_get_width(reference_window)

  api.nvim_buf_set_lines(fbufid, 0, -1, true, { identifier })
  add_highlight(fbufid, 'FloatingIdentifierBufferNr', 0, #identifier_bufnr)
  add_highlight(fbufid, 'FloatingIdentifierBufferName', #identifier_bufnr, width)

  local floating_identifier_winid = api.nvim_open_win(fbufid, 0, {
    relative = 'win',
    height = 1,
    width = #identifier,
    row = 0,
    col = width - #identifier,
    win = reference_window,
    style = 'minimal',
    focusable = false,
    noautocmd = true,
  })

  api.nvim_win_set_var(reference_window, prefix('winid'), floating_identifier_winid)
  api.nvim_set_current_win(reference_window)
end

local close_all = function()
  for _, buf in ipairs(api.nvim_list_bufs()) do
    if api.nvim_buf_get_option(buf, 'filetype') == name then
      pcall(api.nvim_buf_delete, buf, { force = true })
    end
  end
end

local reload = function()
  close_all()

  local curtab = api.nvim_get_current_tabpage()
  local curwin = api.nvim_get_current_win()

  for _, winid in ipairs(api.nvim_tabpage_list_wins(curtab)) do
    local ok, config = pcall(api.nvim_win_get_config, winid)

    if curwin ~= winid and ok and config.relative == '' then
      M.show(winid)
    end
  end

  api.nvim_set_current_win(curwin)
end

api.nvim_create_user_command('FloatingIdReload', reload, {})

vim.my.utils.augroup('floating:ids', {
  {
    events = { 'TabNew', 'TabEnter', 'WinNew', 'WinEnter', 'VimResized' },
    pattern = '*',
    callback = reload,
  },
})
