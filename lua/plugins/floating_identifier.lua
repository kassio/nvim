local M = {}
local api = vim.api
local last_active = nil

local name = 'floating_identifier'
local prefix = function(txt)
  return name .. txt
end

local hlnamespace = api.nvim_create_namespace(name)
local add_highlight = function(bufid, hlname, col_start, col_end)
  api.nvim_buf_add_highlight(bufid, hlnamespace, hlname, 0, col_start, col_end)
end
local hls = {
  bufnr = { name = prefix('BufferNr'), fg = '#98c379', bg = '#3e4452' },
  bufname = { name = prefix('BufferName'), fg = '#61afef', bg = '#3e4452' },
}
for _, h in pairs(hls) do
  vim.my.utils.define_highlight(h.name, h)
end

M.show = function(reference_window)
  reference_window = reference_window or api.nvim_get_current_win()
  last_active = reference_window

  local rbufid = api.nvim_win_get_buf(reference_window)
  if api.nvim_buf_get_option(rbufid, 'buftype') ~= '' then
    return
  end

  fbufid = api.nvim_create_buf(false, true)
  api.nvim_buf_set_option(fbufid, 'filetype', name)

  local name = api.nvim_buf_get_name(rbufid)
  if name == '' then
    return
  end

  local identifier_bufnr = string.format(' %d ', rbufid)
  local identifier_bufname = string.format(' %s ', vim.fn.fnamemodify(name, ':~:.'))
  local identifier = identifier_bufnr .. identifier_bufname
  local width = api.nvim_win_get_width(reference_window)
  local leftpadding = string.rep(' ', width - #identifier)

  api.nvim_buf_set_lines(fbufid, 0, -1, true, { leftpadding .. identifier })
  add_highlight(fbufid, hls.bufnr.name, #leftpadding, #leftpadding + #identifier_bufnr)
  add_highlight(fbufid, hls.bufname.name, #identifier_bufnr + #leftpadding, width)

  floating_identifier_winid = api.nvim_open_win(fbufid, 0, {
    relative = 'win',
    height = 1,
    width = width,
    row = 0,
    col = 0,
    win = reference_window,
    style = 'minimal',
    focusable = false,
    noautocmd = true,
  })

  api.nvim_win_set_var(reference_window, prefix('winid'), floating_identifier_winid)
  api.nvim_set_current_win(reference_window)
end

M.hide = function()
  local ok, winid = pcall(api.nvim_win_get_var, 0, prefix('winid'))
  if not ok then
    return
  end

  local ok, buf = pcall(api.nvim_win_get_buf, winid)
  if not ok or api.nvim_buf_get_option(buf, 'filetype') ~= name then
    return
  end

  pcall(api.nvim_win_hide, winid)
end

M.close_all = function()
  for _, buf in ipairs(api.nvim_list_bufs()) do
    if api.nvim_buf_get_option(buf, 'filetype') == name then
      pcall(api.nvim_buf_delete, buf, { force = true })
    end
  end
end

M.reload = function()
  M.close_all()

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

vim.floating_identifier = M

-- vim.my.utils.command('FloatingIdReload lua vim.floating_identifier.reload()')

vim.my.utils.augroup('floating:ids', {
  {
    events = 'TabNew,TabEnter,WinNew,WinEnter,VimResized',
    pattern = '*',
    callback = vim.floating_identifier.reload,
  },
})
