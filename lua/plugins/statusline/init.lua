local lualine = R('lualine')

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
    theme = 'onedark',
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
          error = vim.my.signs.error,
          warn = vim.my.signs.warn,
          hint = vim.my.signs.hint,
          info = vim.my.signs.info,
        },
        color_error = vim.my.colors.error,
        color_warn = vim.my.colors.warn,
        color_hint = vim.my.colors.hint,
        color_info = vim.my.colors.info,
      },
      {
        vim.my.treesitter.gps.location,
      },
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
