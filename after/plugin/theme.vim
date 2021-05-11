lua <<EOL
local g = vim.g
local cmd = vim.cmd

local status, _ = pcall(cmd, 'colorscheme '..g.my_theme.colorscheme)
if not(status) then
  print('Failed to load theme '..g.my_theme.colorscheme)
end

cmd('set background='..g.my_theme.background)

vim.fn['theme#defaults#load']()

R('my/plugin/statusline')

if ok then
  -- Use statusline theme colors on tabline
  local statusline_theme_path = 'lualine/themes/'..g.my_theme.statuline
  local colors = require(theme_path).normal

  vim.cmd('hi! TabLineSel guibg='..colors.a.bg..' guifg='..colors.a.fg)
  vim.cmd('hi! TabLine guibg='..colors.b.bg..' guifg='..colors.b.fg)
  vim.cmd('hi! link TabLineFill TabLine')
end
EOL
