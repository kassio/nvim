set termguicolors
set synmaxcol=300
set colorcolumn=80

set background=dark
colorscheme OceanicNext

hi! StatusLine guifg=#eeeeee guibg=#3e5570
hi! StatusLineNC guifg=#888888 guibg=#515966

hi! SLModeNormal guifg=#cccccc guibg=#5a87ad
hi! SLModeInsert guifg=#595959 guibg=#badb51
hi! SLModeVisual guifg=#eeeeee guibg=#cd9cce
hi! SLUnsavedFile guifg=#eeeeee guibg=#cc4a21
hi! SLModeTerminal guifg=#595959 guibg=#eeeeee

hi! StatusWarning guifg=#65737e guibg=#fac863
hi! StatusSuccess guifg=#cccccc guibg=#5b903f
hi! StatusError guifg=#ee6060 guibg=#b01010

hi! link TabLine StatusLine
hi! link TabLineFill StatusLine
hi! link TabLineSel SLModeNormal

hi! VertSplit guibg=NONE

hi! Colorcolumn guibg=#1e2d35
hi! link CursorColumn Colorcolumn
hi! link CursorLine Colorcolumn

hi! Search gui=standout guifg=#fac863 guibg=#65737e

hi! NeomakeMessageSignDefault gui=bold
hi! NeomakeErrorSign gui=bold
hi! NeomakeWarningSign gui=bold

hi! link SignifySignAdd NeomakeMessageSign
hi! link SignifyLineAdd SignifySignAdd

hi! link SignifySignDelete NeomakeErrorSign
hi! link SignifySignDeleteFirstLine SignifySignDelete
hi! link SignifyLineDelete SignifySignDelete
hi! link SignifyLineDeleteFirstLine SignifySignDelete

hi! link SignifySignChange NeomakeWarningSign
hi! link SignifySignChangeDelete SignifySignChange
hi! link SignifyLineChange SignifySignChange
hi! link SignifyLineChangeDelete SignifySignChange
