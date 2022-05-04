local M = {
  -- Generic values (independent of the background)
  colorscheme = 'one-nvim',
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
    colors = {
      background = '#282C34',
      error = '#CA1243',
      warn = '#F7C154',
      info = '#6699CC',
      hint = '#50A14F',
      ignore = '#CCCCCC',
      shadow = '#2E3139',
      light_shadow = '#4b5263',
    },
    statusline = 'onedark',
  },
  light = {
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
