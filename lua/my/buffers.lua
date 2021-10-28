local M = {}
local utils = R('my.utils')
local api = vim.api
local fn = vim.fn

M.delete_all = function()
  for _, buf in ipairs(api.nvim_list_bufs()) do
    api.nvim_buf_delete(buf, { force = true })
  end
end

M.delete_hidden = function()
  for _, buf in ipairs(api.nvim_list_bufs()) do
    if vim.tbl_isempty(vim.fn.win_findbuf(buf)) then
      api.nvim_buf_delete(buf, { force = true })
    end
  end
end

M.trim = function()
  local hlsearch = vim.opt_global.hlsearch:get()
  vim.opt.hlsearch = false

  utils.preserve(function()
    vim.cmd([[silent %s/\v\s+$//e]])
    vim.cmd([[silent %s/\v($\n\s*)+%$//e]])
  end)

  vim.opt.hlsearch = hlsearch
end

M.restore_cursor_position = function()
  if fn.line("'\"") > 0 and fn.line("'\"") <= fn.line('$') then
    vim.cmd('normal! g`"')
  end
end

M.autosave = function()
  if vim.opt_local.modified:get() then
    M.trim()
    vim.cmd('silent! write!')
  end
end

M.indent = function()
  utils.preserve(function()
    vim.cmd([[normal! gg=G]])
  end)
end

M.fileicon = function()
  if not vim.b.fileicon then
    vim.b.fileicon = vim.my.utils.fileicon(vim.bo.filetype, vim.fn.expand('%:t'))
  end

  return vim.b.fileicon
end

return M
