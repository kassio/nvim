local original = require'lualine/components/filename'
local utils = require'my/utils'

local filename = function()
  local name = vim.fn.expand('%')

  if #name > 40 then
    return vim.fn.pathshorten(name)
  else
    return name
  end
end

local modified = function()
  if vim.bo.modified then
    return '[+]'
  elseif vim.bo.modifiable == false then
    return '[-]'
  end
end

return function()
  return table.concat({
    utils.fileicon(),
    filename(),
    modified()
  }, ' ')
end
