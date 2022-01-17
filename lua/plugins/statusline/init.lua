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
    lualine_a = { utils.mode },
    lualine_b = {
      {
        utils.bufnr,
        separator = '│',
      },
      {
        utils.spacer,
        padding = 0,
      },
      {
        'filetype',
        colored = true,
        icon_only = true,
        padding = 0,
      },
      utils.filename,
    },
    lualine_c = {
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
      { vim.my.treesitter.gps.location },
    },
    lualine_x = {
      {
        'encoding',
        padding = 0,
        separator = ' ',
      },
      {
        'fileformat',
        padding = 0,
      },
      {
        utils.spacer,
        padding = 0,
      },
    },
    lualine_y = { 'diff' },
    lualine_z = {
      { '[[%3l:%-3c]]' },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = { utils.bufnr },
    lualine_c = { utils.filename },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
