local utils = require('plugins.statusline.utils')

local neoterm_id = function()
  return 'neoterm-' .. vim.b.neoterm_id
end

return {
  sections = {
    lualine_a = { utils.bufnr },
    lualine_b = { neoterm_id },
    lualine_z = { utils.mode },
  },
  inactive_sections = {
    lualine_a = { utils.bufnr },
    lualine_b = { neoterm_id },
    lualine_z = {},
  },
  filetypes = { 'neoterm' },
}
