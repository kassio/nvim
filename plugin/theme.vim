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
  " statusline colors
  hi! STLSeparation    ctermbg=242 ctermfg=242           guibg=#555555 guifg=#555555
  hi! STLBufferNumber  ctermbg=17  ctermfg=190 term=bold guibg=#00005f guifg=#dfff00
  hi! STLFileName      ctermbg=81  ctermfg=17  term=bold guibg=#268bd2 guifg=#00005f
  hi! STLFileData      ctermbg=255 ctermfg=17  term=bold guibg=#eeeeee guifg=#00005f
  hi! STLErrorAlert    ctermbg=1   ctermfg=0   term=bold guibg=#800000 guifg=#000000
  hi! STLSuccessAlert  ctermbg=22  ctermfg=15  term=bold guibg=#800000 guifg=#000000
  hi! STLWarningAlert  ctermbg=3   ctermfg=0   term=bold guibg=#dfdf00 guifg=#000000
  hi! link STLStats    STLFileData

  hi! link TrailingSpaces STLErrorAlert
  match TrailingSpaces /\s\+$\| \+\ze\\t/
endif
