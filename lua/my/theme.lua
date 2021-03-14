local M = {}

M.load = function(theme_name)
  -- Set statusline theme
  require'lualine'.options.theme = theme_name

  -- Use statusline theme colors on tabline
  local theme_path = 'lualine/themes/'..theme_name
  local theme = require(theme_path)
  local colors = theme.normal

  vim.cmd('hi! TabLineSel guibg='..colors.a.bg..' guifg='..colors.a.fg)
  vim.cmd('hi! TabLine guibg='..colors.b.bg..' guifg='..colors.b.fg)
  vim.cmd('hi! link TabLineFill TabLine')
end

return M
