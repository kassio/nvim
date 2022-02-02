local signs = {
  error = '',
  warn = '',
  hint = '',
  info = '',
  bug = '',
}

local icons = {
  buffer = '',
  snippy = '',
  nvim_lsp = '',
  nvim_lua = '',
  path = 'פּ',
  spell = '暈',
  treesitter = '',
}

local colors = {
  dark = {
    background = '#282C34',
    error = '#CA1243',
    warn = '#F7C154',
    info = '#6699CC',
    hint = '#50A14F',
    ignore = '#CCCCCC',
    shadow = '#2E3139',
  },
  light = {
    background = '#fafafa',
    error = '#CA1243',
    warn = '#F7C154',
    info = '#6699CC',
    hint = '#50A14F',
    ignore = '#CCCCCC',
    shadow = '#f0f0f0',
  },
}
setmetatable(colors, {
  __index = function(values, key)
    return values[vim.o.background][key]
  end,
})

local colorschemes = {
  dark = 'onedark',
  light = 'onelight',
}

local M = {
  signs = signs,
  icons = icons,
  colors = colors,
}

setmetatable(M, {
  __index = function(values, key)
    if key == 'colorscheme' then
      return colorschemes[vim.o.background]
    else
      return values[key]
    end
  end,
})

return M
