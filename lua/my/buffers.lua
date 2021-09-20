local M = {}
local utils = R('my.utils')
local api = vim.api
local fn = vim.fn

M.delete_all = function()
  for _, buf in ipairs(api.nvim_list_bufs()) do
    api.nvim_buf_delete(buf, { force = true })
  end
end

M.delete_unloaded = function()
  for _, buf in ipairs(api.nvim_list_bufs()) do
    if not (api.nvim_buf_is_loaded(buf)) or not (api.nvim_buf_is_valid(buf)) then
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

return M
