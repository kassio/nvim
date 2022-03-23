local M = {}

M.show = function()
  local reference_window = vim.api.nvim_get_current_win()
  local rbufid = vim.api.nvim_win_get_buf(reference_window)

  fbufid = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(fbufid, 'filetype', 'floating_identifier')

  if vim.api.nvim_buf_get_option(rbufid, 'buftype') ~= '' then
    return
  end

  local name = vim.api.nvim_buf_get_name(rbufid)
  if name == '' then
    return
  end

  identifier = string.format(' %d | %s ', rbufid, vim.fn.fnamemodify(name, ':~:.'))

  vim.api.nvim_buf_set_lines(fbufid, 0, -1, true, { identifier })

  local reference_width = vim.api.nvim_win_get_width(reference_window)
  local width = math.min(80, math.floor(reference_width * 0.8))
  local row = vim.api.nvim_win_get_height(reference_window) - 1
  local col = reference_width - width

  floating_identifier_winid = vim.api.nvim_open_win(fbufid, 0, {
    relative = 'win',
    height = 1,
    width = width,
    row = row,
    col = col,
    win = reference_window,
    zindex = 999,
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

  local buf = vim.api.nvim_win_get_buf(winid)
  if vim.api.nvim_buf_get_option(buf, 'filetype') == 'floating_identifier' then
    pcall(vim.api.nvim_win_hide, winid)
  end
end

vim.floating_identifier = M

vim.my.utils.augroup('floating:ids', {
  { 'WinLeave', '*', 'lua vim.floating_identifier.show()' },
  { 'WinEnter', '*', 'lua vim.floating_identifier.hide()' },
})
