local lualine = require('lualine')
local theme = vim.my.theme

local utils = require('plugins.statusline.utils')

local sections = {
  lualine_a = { '%n' }, -- buffer number
  lualine_b = {
    {
      'filetype',
      colored = true,
      icon_only = true,
      padding = { left = 1, right = 0 },
    },
    utils.spacer,
    {
      'filename',
      file_status = true,
      path = 1,
      shorting_target = 30,
      symbols = { modified = ' ', readonly = ' ', unnamed = ' [No Name] ' },
      padding = 0,
    },
    utils.spacer,
  },
  lualine_c = {
    utils.go_package,
    vim.my.treesitter.gps.location,
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
    },
  },
  lualine_y = { 'diff' },
  lualine_z = {
    { '[[%3l:%-3c]]' },
    utils.mode(),
  },
}

local filetree_sections = vim.tbl_extend('force', sections, {
  lualine_b = { utils.filetree_current_file },
})
local neoterm_sections = vim.tbl_extend('force', sections, {
  lualine_b = { utils.neoterm_id },
})

lualine.setup({
  extensions = {
    { sections = filetree_sections, filetypes = { 'NvimTree' } },
    { sections = neoterm_sections, filetypes = { 'neoterm' } },
  },
  options = {
    theme = theme.statusline,
    icons_enabled = true,
    section_separators = '',
    component_separators = '',
    globalstatus = true,
  },
  sections = sections,
})
