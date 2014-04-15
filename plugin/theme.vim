if exists('b:theme_setup_loaded')
  finish
endif
let b:theme_setup_loaded=1

if has("syntax")
  syntax enable
  set t_Co=256
  set background=dark
  set synmaxcol=500

  colorscheme solarized

  hi! SpecialKey ctermfg=239 ctermbg=NONE guifg=Gray30 guibg=NONE

  hi! link NonText SpecialKey
  hi! VertSplit ctermbg=NONE

  hi! TrailingSpaces ctermbg=1 ctermfg=0 term=bold guibg=#800000 guifg=#000000
  match TrailingSpaces /\s\+$\| \+\ze\\t/
endif
