local lualine = require'lualine'

lualine.status{
    options = {
      theme = 'onelight',
      icons_enabled = true,
    },
    sections = {
      lualine_a = { {'mode', upper = true} },
      lualine_b = {
        'filetype',
        {
          'filename',
          full_name = true,
          file_status = true
        },
        'diff'
      },
      lualine_x = { 'branch', 'encoding', 'fileformat' },
      lualine_y = { 'progress' },
      lualine_z = {
        { '[[%3l:%-2c  %L]]' }
      },
    },
    inactive_sections = {
      lualine_c = { 'filename' },
    }
  }
