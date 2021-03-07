local g = vim.g
local lualine = require'lualine'

local mode = require'my/plugin/statusline/mode'

lualine.status{
    options = {
      theme = 'onelight',
      section_separators = {'', ''},
      component_separators = {'', ''},
      icons_enabled = true,
    },
    sections = {
      lualine_a = { { mode } },
      lualine_b = {
        'filetype',
        { 'filename', full_name = true, file_status = true }
      },
      lualine_c = {
        {
          'diagnostics',
          sources = { 'nvim_lsp' },
          sections = { 'error', 'warn', 'info' }
        }
      },
      lualine_x = {
        'diff',
        'branch'
      },
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
      lualine_b = { },
      lualine_c = { 'filename' },
      lualine_x = { },
      lualine_y = { },
      lualine_z = { }
    }
  }
