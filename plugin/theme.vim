if has("syntax")
  syntax enable
  set t_Co=256
  set background=dark
  set synmaxcol=500

  colorscheme solarized
  hi! SpecialKey ctermfg=239 ctermbg=NONE guifg=Gray30 guibg=NONE
  hi! link NonText SpecialKey
  hi! VertSplit ctermbg=NONE
  " statusline colors
  hi! STLBufferNumber  ctermbg=17  ctermfg=190 term=bold
  hi! STLFileName      ctermbg=4   ctermfg=17  term=bold
  hi! STLFileData      ctermbg=255 ctermfg=17  term=bold
  hi! STLErrorAlert    ctermbg=1   ctermfg=16  term=bold
  hi! STLWarningAlert  ctermbg=3   ctermfg=16  term=bold
  hi! link STLStats    STLFileData
endif
