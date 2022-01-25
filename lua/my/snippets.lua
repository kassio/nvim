local M = {}

M.filename = function(case)
  local filename = vim.api.nvim_buf_get_name(0)
  filename = vim.fn.fnamemodify(filename, ':t:r')

  if case == 'camelcase' then
    return filename:gsub('_(.)', filename.upper):gsub('^(.)', filename.upper)
  else
    return filename
  end
end

M.expand = function(fmt, default)
  local path = vim.fn.expand(fmt)

  if path == '.' then
    return default or path
  else
    return path
  end
end

return M
