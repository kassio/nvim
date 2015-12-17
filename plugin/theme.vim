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

hi! StatusLine   guifg=#cccccc guibg=#3f5f85
hi! StatusLineNC guifg=#8ba6ab guibg=#3f5f85

hi! SLModeNormal   guifg=#3f5f85 guibg=#cccccc
hi! SLModeInsert   guifg=#496022 guibg=#badb51
hi! SLModeVisual   guifg=#496022 guibg=#cd9cce
hi! SLModeTerminal guifg=#496022 guibg=#a1d0a0
hi! SLSection1     guifg=#cccccc guibg=#595959
hi! SLSection2     guifg=#cccccc guibg=#5a87ad
hi! SLUnsavedFile  guifg=#cccccc guibg=#cc4a21

" Markdown styles
hi! link markdownItalic markdownBold
