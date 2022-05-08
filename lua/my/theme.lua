require('nightfox').setup({})

local M = {
  -- Generic values (independent of the background)
  signs = {
    error = '',
    warn = '',
    hint = '',
    info = '',
    bug = '',
  },
  icons = {
    buffer = '',
    snippy = '',
    nvim_lsp = '',
    nvim_lua = '',
    path = 'פּ',
    spell = '暈',
    treesitter = '',
  },
  -- Background dependent values
  dark = {
    colorscheme = 'nightfox',
    colors = {
      background = '#1B232F',
      error = '#CA1243',
      warn = '#F7C154',
      info = '#6699CC',
      hint = '#50A14F',
      ignore = '#51596c',
      shadow = '#181f2a',
      light_shadow = '#2a374a',
    },
    statusline = 'onedark',
  },
  light = {
    colorscheme = 'dayfox',
    colors = {
      background = '#fafafa',
      error = '#CA1243',
      warn = '#F7C154',
      info = '#6699CC',
      hint = '#50A14F',
      ignore = '#CCCCCC',
      shadow = '#f0f0f0',
      light_shadow = '#f0f0f0',
    },
    statusline = 'onelight',
  },
}

setmetatable(M, {
  __index = function(values, key)
    return values[vim.o.background][key]
  end,
})

return M
