local devicons = require'nvim-web-devicons'
local original = require'lualine/components/filename'

local filetype_extensions = {
  ruby = 'rb',
  sh = 'sh',
  bash = 'bash',
  zsh = 'zsh'
}

local extension = function(type)
  return filetype_extensions[type] or vim.fn.expand('%:e')
end

local fileicon = function()
  local data = vim.bo.filetype

  if #data > 0 then
    local name = vim.fn.expand('%:t')

    return devicons.get_icon(name, extension(data), { default = true })
  else
    return ''
  end
end

local filename = function()
  local value = original.init{
    full_name = true,
    file_status = true
  }()

  local icon = fileicon()
  -- local icon = ''

  return icon .. ' ' .. value
end

return filename
