local g = vim.g
local lualine = require'lualine'

local mode = require'my/plugin/statusline/mode'
local filename = require'my/plugin/statusline/filename'
local bufnr = require'my/plugin/statusline/bufnr'

lualine.setup{
  extensions = { 'nvim-tree' },
  options = {
    theme = g.my_theme.statuline,
    icons_enabled = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = {
      { bufnr },
      { filename }
    },
    lualine_c = {
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
        sections = { 'error', 'warn', 'info' }
      }
    },
    lualine_x = { 'diff' },
    lualine_y = {
      'encoding',
      'fileformat'
    },
    lualine_z = {
      { '[[%3l:%-2c  %L]]' }
    },
  },
  inactive_sections = {
    lualine_a = { },
    lualine_b = { bufnr },
    lualine_c = { filename },
    lualine_x = { },
    lualine_y = { },
    lualine_z = { }
  }
}
