local filename = function()
  local name = vim.fn.expand('%:.')

  if #name > (vim.api.nvim_win_get_width(0) - 60) then
    return vim.fn.pathshorten(name)
  else
    return name
  end
end

local modified = function()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false then
    return '-'
  end
end

return function()
  return table.concat({
    vim.my.utils.fileicon(vim.bo.filetype, vim.fn.expand('%:t')),
    filename(),
    modified(),
  }, ' ')
end
