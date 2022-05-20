local set_background = function()
  local config = vim.env.HOME .. '/.config/kitty/themes/current.conf'

  if vim.fn.filereadable(config) and vim.fn.readfile(config, nil, 1)[1] == '# light' then
    vim.opt.background = 'light'
  else
    vim.opt.background = 'dark'
  end
end

set_background()

require('nightfox').setup({})

local common_colors = {
  error = '#CA1243',
  warn = '#F7C154',
  info = '#6699CC',
  hint = '#50A14F',
  light_error = '#FD83A1',
  light_warn = '#FFF4A8',
  light_info = '#A5D0FF',
  light_hint = '#B5E6CE',
}

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
    colors = vim.tbl_extend('error', common_colors, {
      background = '#1B232F',
      shadow = '#181F2A',
      highlight = '#51596c',
    }),
  },
  light = {
    colorscheme = 'dayfox',
    statusline = 'tomorrow',
    colors = vim.tbl_extend('error', common_colors, {
      background = '#EAEAEA',
      shadow = '#DBDBDB',
      highlight = '#E4ECFF',
    }),
  },
}

setmetatable(M, {
  __index = function(values, key)
    return values[vim.o.background][key]
  end,
})

return M
