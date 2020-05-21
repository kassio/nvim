syntax sync minlines=512

set termguicolors
set lazyredraw
set regexpengine=2
set colorcolumn=80,100,120
set synmaxcol=200

let g:enable_bold_font = 1
let g:enable_italic_font = 1
let g:hybrid_transparent_background = 1
set background=light
colorscheme PaperColor

hi! StatusLine ctermfg=NONE ctermbg=NONE guifg=#444444 guibg=#bcbcbc
hi! StatusLineNC ctermbg=NONE guibg=#005f87

hi! link LineNr EndOfBuffer
hi! link SignColumn EndOfBuffer

hi! SignError gui=bold guifg=#EC5F67 guibg=NONE
hi! SignWarning gui=bold guifg=#FAC863 guibg=NONE
hi! SignInfo gui=bold guifg=#6699CC guibg=NONE
hi! SignSuccess gui=bold guifg=#3E9E34 guibg=NONE

hi! StatusWarning gui=bold guifg=#FAC863 guibg=NONE
hi! StatusSuccess gui=bold guifg=#99C794 guibg=NONE
hi! StatusError gui=bold guifg=#EC5F67 guibg=NONE

hi! SLStatusWarning gui=bold guifg=#FAC863 guibg=#343D46
hi! SLStatusSuccess gui=bold guifg=#99C794 guibg=#343D46
hi! SLStatusError gui=bold guifg=#EC5F67 guibg=#343D46

hi! WarningMsg guifg=#FAC863

hi! link TabLine StatusLineNC
hi! link TabLineFill StatusLineNC
hi! link TabLineSel SLModeNormal

hi! link SignifySignAdd SignSuccess
hi! link SignifyLineAdd SignifySignAdd

hi! link SignifySignDelete SignError
hi! link SignifySignDeleteFirstLine SignifySignDelete
hi! link SignifyLineDelete SignifySignDelete
hi! link SignifyLineDeleteFirstLine SignifySignDelete

hi! link SignifySignChange SignWarning
hi! link SignifySignChangeDelete SignifySignChange
hi! link SignifyLineChange SignifySignChange
hi! link SignifyLineChangeDelete SignifySignChange

hi! link ALEWarningSign SignWarning
hi! link ALESignColumnWithWarnings SignWarning
hi! link ALEStyleWarningSign SignWarning

hi! link ALEErrorSign SignError
hi! link ALESignColumnWithErrors SignError
hi! link ALEStyleErrorSign SignError

hi! ALEError guibg=NONE guifg=NONE
hi! ALEWarning guibg=NONE guifg=NONE

hi! MatchParen gui=bold guifg=NONE guibg=NONE

hi! SpellBad cterm=none gui=italic ctermbg=NONE ctermfg=NONE guifg=none guibg=NONE
hi! SpellCap cterm=none gui=none ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
hi! SpellRare cterm=none gui=none ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE
hi! SpellLocal cterm=none gui=none ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

hi! Comment gui=italic
