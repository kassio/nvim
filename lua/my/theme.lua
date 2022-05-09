if vim.fn.readfile(vim.env.HOME .. '/.cache/term_profile')[1] == 'light' then
  vim.opt.background = 'light'
else
  vim.opt.background = 'dark'
end

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
    statusline = 'nightfly',
    colors = {
      background = '#1B232F',
      error = '#CA1243',
      warn = '#F7C154',
      info = '#6699CC',
      hint = '#50A14F',
      ignore = '#51596c',
      shadow = '#181F2A',
      light_shadow = '#2A374A',
    },
  },
  light = {
    colorscheme = 'dayfox',
    statusline = 'tomorrow',
    colors = {
      background = '#EAEAEA',
      error = '#CA1243',
      warn = '#F7C154',
      info = '#6699CC',
      hint = '#50A14F',
      ignore = '#CCCCCC',
      shadow = '#D2D2D2',
      light_shadow = '#ECECEC',
    },
  },
}

setmetatable(M, {
  __index = function(values, key)
    return values[vim.o.background][key]
  end,
})

return M
