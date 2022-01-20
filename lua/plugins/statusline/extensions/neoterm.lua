local utils = require('plugins.statusline.utils')

local neoterm_id = function()
  return 'neoterm-' .. vim.b.neoterm_id
end

return {
  sections = {
    lualine_a = { utils.mode },
    lualine_b = { utils.bufnr },
    lualine_z = { neoterm_id },
  },
  filetypes = { 'neoterm' },
}
