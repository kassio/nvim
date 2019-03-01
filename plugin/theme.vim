set termguicolors
set lazyredraw
set regexpengine=2
set colorcolumn=80
set synmaxcol=200
syntax sync minlines=512

" STATUS BG #343D46
" STATUS BG ACTIVE #4F5B66

function! s:custom_highlights()
  hi! LineNr guibg=NONE
  hi! SignColumn guibg=NONE

  hi! VertSplit guibg=NONE guifg=#515966 gui=NONE term=NONE cterm=NONE
  hi! EndOfBuffer guibg=NONE guifg=#1B2B34 gui=NONE term=NONE cterm=NONE

  hi! SignError gui=bold guifg=#EC5F67 guibg=NONE
  hi! SignWarning gui=bold guifg=#FAC863 guibg=NONE
  hi! SignInfo gui=bold guifg=#6699CC guibg=NONE
  hi! SignSuccess gui=bold guifg=#3E9E34 guibg=NONE

  hi! StatusLine gui=bold guifg=#CCCCCC guibg=#343D46 term=bold cterm=bold
  hi! StatusLineNC gui=NONE guifg=#888888 guibg=#4F5B66 term=NONE cterm=NONE

  hi! SLModeNormal gui=bold guifg=#CCCCCC guibg=#343D46
  hi! SLModeInsert gui=bold guifg=#595959 guibg=#BADB51
  hi! SLModeVisual gui=bold guifg=#CCCCCC guibg=#CD9CCE
  hi! SLUnsavedFile gui=bold guifg=#CCCCCC guibg=#CC4A21
  hi! SLModeTerminal gui=bold guifg=#595959 guibg=#CCCCCC

  hi! StatusWarning gui=bold guifg=#FAC863 guibg=#3E5570
  hi! StatusSuccess gui=bold guifg=#99C794 guibg=#3E5570
  hi! StatusError gui=bold guifg=#EC5F67 guibg=#3E5570

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

  hi! ALEError guibg=NONE guifg=NONE
  hi! ALEWarning guibg=NONE guifg=NONE
endfunction

function! Dark()
  set background=dark
  colorscheme base16-oceanicnext

  hi! ColorColumn guibg=#1E2D35
  hi! CursorLine guibg=#1F313A term=NONE cterm=NONE
  hi! CursorColumn guibg=#1F313A term=NONE cterm=NONE

  hi! CursorLineNr guifg=#CCCCCC guibg=#1F313A
  hi! nCursor guibg=#1F313A
  hi! iCursor guifg=#CCCCCC

  call s:custom_highlights()
endfunction

function! Bright()
  highlight clear

  set background=light
  colorscheme base16-solarized-light

  call s:custom_highlights()
endfunction

call Dark()
