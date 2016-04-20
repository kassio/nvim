syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark

set synmaxcol=500
set colorcolumn=80

hi! VertSplit guibg=NONE

hi! StatusWarning guifg=#65737e guibg=#fac863
hi! StatusSuccess guifg=#cccccc guibg=#5b903f
hi! StatusError   guifg=#ec5f67 guibg=#b70006

hi! StatusLine   guifg=#cccccc guibg=#3E5570 ctermfg=15 ctermbg=4
hi! StatusLineNC guifg=#888888 guibg=#515966 ctermfg=8 ctermbg=4

hi! SLModeNormal   guifg=#3f5f85 guibg=#cccccc ctermfg=8 ctermbg=15
hi! SLModeInsert   guifg=#8ba6ab guibg=#badb51 ctermfg=8 ctermbg=114
hi! SLModeVisual   guifg=#8ba6ab guibg=#cd9cce ctermfg=8 ctermbg=176
hi! SLSection1     guifg=#cccccc guibg=#595959 ctermfg=15 ctermbg=8
hi! SLSection2     guifg=#cccccc guibg=#5a87ad ctermfg=15 ctermbg=6
hi! SLUnsavedFile  guifg=#cccccc guibg=#cc4a21 ctermfg=15 ctermbg=203

" Markdown styles
hi! link markdownItalic markdownBold
