local M = {}
local last_active = nil

M.show = function(reference_window)
  reference_window = reference_window or vim.api.nvim_get_current_win()
  last_active = reference_window

  local rbufid = vim.api.nvim_win_get_buf(reference_window)
  if vim.api.nvim_buf_get_option(rbufid, 'buftype') ~= '' then
    return
  end

  fbufid = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(fbufid, 'filetype', 'floating_identifier')

  local name = vim.api.nvim_buf_get_name(rbufid)
  if name == '' then
    return
  end

  identifier = string.format(' %d | %s ', rbufid, vim.fn.fnamemodify(name, ':~:.'))

  vim.api.nvim_buf_set_lines(fbufid, 0, -1, true, { identifier })

  local reference_width = vim.api.nvim_win_get_width(reference_window)
  local width = math.min(80, math.floor(#identifier))
  local row = vim.api.nvim_win_get_height(reference_window) - 1
  local col = reference_width - width

  floating_identifier_winid = vim.api.nvim_open_win(fbufid, 0, {
    relative = 'win',
    height = 1,
    width = width,
    row = row,
    col = col,
    win = reference_window,
    style = 'minimal',
    focusable = false,
    noautocmd = true,
  })

  vim.api.nvim_win_set_var(reference_window, 'floating_identifier_winid', floating_identifier_winid)
  vim.api.nvim_set_current_win(reference_window)
end

M.hide = function()
  local ok, winid = pcall(vim.api.nvim_win_get_var, 0, 'floating_identifier_winid')
  if not ok then
    return
  end

  local ok, buf = pcall(vim.api.nvim_win_get_buf, winid)
  if not ok or vim.api.nvim_buf_get_option(buf, 'filetype') ~= 'floating_identifier' then
    return
  end

  pcall(vim.api.nvim_win_hide, winid)
end

M.reload = function()
  for _, winid in ipairs(vim.api.nvim_list_wins()) do
    local config = vim.api.nvim_win_get_config(winid)

    if config.relative == 'win' and tostring(config.win) == tostring(last_active) then
      local ok, buf = pcall(vim.api.nvim_win_get_buf, winid)
      if ok and vim.api.nvim_buf_get_option(buf, 'filetype') == 'floating_identifier' then
        pcall(vim.api.nvim_buf_delete, buf, { force = true })
      end
    end
  end
end

vim.floating_identifier = M

vim.my.utils.augroup('floating:ids', {
  { 'WinLeave', '*', 'lua vim.floating_identifier.show()' },
  { 'WinEnter', '*', 'lua vim.floating_identifier.hide()' },
  { 'WinClosed', '*', 'lua vim.floating_identifier.reload()' },
})
