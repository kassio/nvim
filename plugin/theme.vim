syntax enable
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme OceanicNext
set background=dark

set synmaxcol=500
set colorcolumn=80

hi! VertSplit guibg=NONE guifg=#81543a

hi! StatusWarning guifg=#fac863
hi! StatusError guifg=#ec5f67
hi! StatusSuccess guifg=#99c794

hi! StatusLine guifg=#76d3ee guibg=#4977a1
hi! StatusLineNC guifg=#65737e guibg=#103635

" Markdown styles
hi! link markdownItalic markdownBold

command! Dark set background=dark
command! Light set background=light
