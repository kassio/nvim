local M = {}

M.snakecase_to_mixedcase = function(str)
  return vim.fn.join(
    vim.tbl_map(function(s)
      return string.gsub(s, '^%l', string.upper)
    end, vim.split(str, '_')),
    ''
  )
end

return M
