local signs = {
  error = '',
  warn = '',
  hint = '',
  info = '',
  bug = '',
}

local colors = {
  dark = {
    background = '#282C34',
    error = '#CA1243',
    warn = '#F7C154',
    info = '#6699CC',
    hint = '#50A14F',
    ignore = '#CCCCCC',
    shadow = '#282F34',
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
