syntax sync minlines=512

set background=dark
set termguicolors
set lazyredraw
set regexpengine=2
set colorcolumn=80,100,120
set synmaxcol=200

let g:onedark_terminal_italics=1
let g:onedark_hide_endofbuffer=1
let g:onedark_termcolors=256
colorscheme onedark

hi! VertSplit guibg=NONE guifg=#323740 gui=NONE term=NONE cterm=NONE

hi! StatusLineNC ctermfg=145 ctermbg=236 guifg=#ABB2BF guibg=#2C323C
hi! StatusLine ctermbg=237 guibg=#3E4452

hi! LineNr guibg=NONE
hi! SignColumn guibg=NONE

hi! SignError gui=bold guifg=#EC5F67 guibg=NONE
hi! SignWarning gui=bold guifg=#FAC863 guibg=NONE
hi! SignInfo gui=bold guifg=#6699CC guibg=NONE
hi! SignSuccess gui=bold guifg=#3E9E34 guibg=NONE

hi! SLModeNormal gui=bold guifg=#CCCCCC guibg=#343D46
hi! SLModeCommand gui=bold guifg=#CCCCCC guibg=#6699CC
hi! SLModeInsert gui=bold guifg=#595959 guibg=#BADB51
hi! SLModeVisual gui=bold guifg=#CCCCCC guibg=#CD9CCE
hi! SLModeTerminal gui=bold guifg=#595959 guibg=#CCCCCC
hi! SLUnsavedFile gui=bold guifg=#CCCCCC guibg=#CC4A21

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

hi! SpellBad cterm=none gui=italic ctermfg=NONE guifg=none
hi! SpellCap ctermfg=NONE guifg=NONE
hi! SpellRare ctermfg=NONE guifg=NONE
hi! SpellLocal ctermfg=NONE guifg=NONE
