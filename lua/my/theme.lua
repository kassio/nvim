local M = {}

M.load = function(theme_name)
  -- Set statusline theme
  local ok, lualine = pcall(require, 'lualine')

  if ok then
    R('my/plugin/statusline')

    -- Use statusline theme colors on tabline
    local theme_path = 'lualine/themes/'..theme_name
    local theme = require(theme_path)
    local colors = theme.normal

    vim.cmd('hi! TabLineSel guibg='..colors.a.bg..' guifg='..colors.a.fg)
    vim.cmd('hi! TabLine guibg='..colors.b.bg..' guifg='..colors.b.fg)
    vim.cmd('hi! link TabLineFill TabLine')
  end
end

return M