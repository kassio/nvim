syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark

set synmaxcol=500
set colorcolumn=80

hi! VertSplit guibg=NONE guifg=#81543a

hi! StatusWarning guifg=#65737e guibg=#fac863
hi! StatusError guibg=#b70006 guifg=#ec5f67
hi! StatusSuccess guibg=#5b903f guifg=#cccccc

hi! StatusLine guifg=#cccccc guibg=#3f5f85
hi! StatusLineNC guifg=#8ba6ab guibg=#3f5f85

hi! User1 guifg=#496022 guibg=#badb51
hi! User2 guifg=#cccccc guibg=#595959
hi! User3 guifg=#cccccc guibg=#5a87ad
hi! User4 guifg=#cccccc guibg=#cc4a21

" Markdown styles
hi! link markdownItalic markdownBold
