if has("syntax")
  syntax enable
  set t_Co=256
  set background=dark

  if !empty(globpath(&rtp, "colors/solarized.vim"))
    colorscheme solarized
    hi! link SpecialKey Comment
    hi! link NonText Comment
  endif
endif
