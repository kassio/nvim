local lualine = R('lualine')
local theme = vim.my.theme

local mode = R('plugins.statusline.mode')
local filename = R('plugins.statusline.filename')
local bufnr = function()
  return tostring(vim.api.nvim_get_current_buf())
end

lualine.setup({
  extensions = {
    R('plugins.statusline.extensions.filetree'),
  },
  options = {
    theme = theme.colorscheme,
    icons_enabled = true,
    section_separators = '',
    component_separators = '│',
  },
  sections = {
    lualine_a = { mode },
    lualine_b = {
      { bufnr },
      { filename },
    },
    lualine_c = {
      {
        'diagnostics',
        sources = { 'nvim_lsp' },
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
    lualine_x = { 'diff' },
    lualine_y = {
      'encoding',
      'fileformat',
    },
    lualine_z = {
      { '[[%3l:%-2c  %L]]' },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = { bufnr },
    lualine_c = { filename },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
})
