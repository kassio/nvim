if has("syntax")
  syntax enable
  set t_Co=256
  set background=dark

  if !empty(globpath(&rtp, "colors/solarized.vim"))
    colorscheme solarized
    hi! SpecialKey ctermfg=239 ctermbg=NONE guifg=Gray30 guibg=NONE
    hi! link NonText SpecialKey
  endif
endif
