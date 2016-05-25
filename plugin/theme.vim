set termguicolors

set background=dark
colorscheme base16-ocean

set synmaxcol=500
set colorcolumn=80

hi! VertSplit guibg=NONE

hi! StatusWarning  guifg=#65737e guibg=#fac863
hi! StatusSuccess  guifg=#cccccc guibg=#5b903f
hi! StatusError    guifg=#ee6060 guibg=#b01010

hi! StatusLine     guifg=#cccccc guibg=#3E5570
hi! StatusLineNC   guifg=#888888 guibg=#515966

hi! SLModeNormal   guifg=#3f5f85 guibg=#cccccc
hi! SLModeInsert   guifg=#8ba6ab guibg=#badb51
hi! SLModeVisual   guifg=#8ba6ab guibg=#cd9cce
hi! SLSection1     guifg=#cccccc guibg=#595959
hi! SLSection2     guifg=#cccccc guibg=#5a87ad
hi! SLUnsavedFile  guifg=#cccccc guibg=#cc4a21

" Markdown styles
hi! link markdownItalic markdownBold
