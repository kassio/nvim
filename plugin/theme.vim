set termguicolors
set synmaxcol=300
set colorcolumn=80

set background=dark
colorscheme OceanicNext

hi! VertSplit guibg=NONE

hi! Colorcolumn guibg=#1e2d35
hi! link CursorColumn Colorcolumn
hi! link CursorLine Colorcolumn

hi! Cursor ctermbg=7 guibg=#e5e5e5

hi! Search gui=standout guifg=#fac863 guibg=#65737e

hi! StatusLine gui=bold guifg=#cccccc guibg=#3e5570
hi! StatusLineNC gui=NONE guifg=#888888 guibg=#515966

hi! SLModeNormal gui=bold guifg=#cccccc guibg=#5a87ad
hi! SLModeInsert gui=bold guifg=#595959 guibg=#badb51
hi! SLModeVisual gui=bold guifg=#cccccc guibg=#cd9cce
hi! SLUnsavedFile gui=bold guifg=#cccccc guibg=#cc4a21
hi! SLModeTerminal gui=bold guifg=#595959 guibg=#cccccc

hi! WarningMsg guifg=#fac863 ctermfg=221

hi! SignError gui=bold guifg=#ec5f67 guibg=#343d46
hi! SignWarning gui=bold guifg=#fac863 guibg=#343d46
hi! SignInfo gui=bold guifg=#6699cc guibg=#343d46
hi! SignSuccess gui=bold guifg=#99c794 guibg=#343d46

hi! link StatusWarning SignWarning
hi! link StatusSuccess SignSuccess
hi! link StatusError SignError
hi! link StatusWarning SignWarning
hi! link StatusSuccess SignSuccess
hi! link StatusError SignError

hi! link TabLine StatusLine
hi! link TabLineFill StatusLine
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
