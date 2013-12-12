if has("syntax")
  syntax enable
  set t_Co=256
  set background=dark
  set synmaxcol=200

  colorscheme solarized
  hi! SpecialKey ctermfg=239 ctermbg=NONE guifg=Gray30 guibg=NONE
  hi! link NonText SpecialKey
  hi! VertSplit ctermbg=NONE
endif
