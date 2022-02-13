local lualine = require('lualine')
local theme = vim.my.theme

local utils = require('plugins.statusline.utils')

lualine.setup({
  extensions = {
    require('plugins.statusline.extensions.filetree'),
    require('plugins.statusline.extensions.neoterm'),
  },
  options = {
    theme = theme.colorscheme,
    icons_enabled = true,
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = { utils.bufnr },
    lualine_b = utils.filename(),
    lualine_c = {
      { vim.my.treesitter.gps.location },
    },
    lualine_x = {
      {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        symbols = {
          error = theme.signs.error,
          warn = theme.signs.warn,
          hint = theme.signs.hint,
          info = theme.signs.info,
        },
        color_error = theme.colors.error,
        color_warn = theme.colors.warn,
        color_hint = theme.colors.hint,
        color_info = theme.colors.info,
      },
    },
    lualine_y = { 'diff' },
    lualine_z = {
      { '[[%3l:%-3c]]' },
      utils.mode,
    },
  },
  inactive_sections = {
    lualine_a = { utils.bufnr },
    lualine_b = utils.filename({ icon_color = false }),
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
