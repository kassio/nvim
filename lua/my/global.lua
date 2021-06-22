local g = vim.g

g.my_themes = {
  dark = {
    background = 'dark',
    colorscheme = 'palenight',
    statuline = 'onedark'
  },
  light = {
    background = 'light',
    colorscheme = 'onehalflight',
    statuline = 'onelight'
  }
}

-- Space as map leader
g.mapleader = ' '

-- Highlight lua within vim
g.vimsyn_embed = 'l'

-- my theme
g.default_theme_variant = 'dark'
g.alternative_theme_variant = 'light'
g.my_theme = g.my_themes[g.default_theme_variant]

-- Disable standard plugins
g.loaded_getscriptPlugin = 1
g.loaded_gzip = 1
g.loaded_netrwPlugin = 1
g.loaded_rrhelper = 1
g.loaded_tarPlugin = 1
g.loaded_tutor_mode_plugin = 1
g.loaded_vimballPlugin = 1
g.loaded_zipPlugin = 1

-- Global signs icons
g.sign_error = '×'
g.sign_hint = '☺'
g.sign_info = 'ⅰ'
g.sign_warning = '⚠'

-- Global status colors
g.status_error_color = '#F5A098'
g.status_warning_color = '#FCEDB6'
g.status_information_color = '#B1EEFA'
g.status_hint_color = '#AEF7AD'
g.status_ignore_color = '#EEEEEE'
