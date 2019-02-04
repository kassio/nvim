set termguicolors
set lazyredraw
set regexpengine=2
set colorcolumn=80
set synmaxcol=200
syntax sync minlines=512


function! s:custom_highlights()
  hi! SignError gui=bold guifg=#ec5f67 guibg=NONE
  hi! SignWarning gui=bold guifg=#fac863 guibg=NONE
  hi! SignInfo gui=bold guifg=#6699cc guibg=NONE
  hi! SignSuccess gui=bold guifg=#99c794 guibg=NONE

  hi! StatusLine gui=bold guifg=#cccccc guibg=#3e5570 term=bold cterm=bold
  hi! StatusLineNC gui=NONE guifg=#888888 guibg=#515966 term=NONE cterm=NONE

  hi! SLModeNormal gui=bold guifg=#cccccc guibg=#5a87ad
  hi! SLModeInsert gui=bold guifg=#595959 guibg=#badb51
  hi! SLModeVisual gui=bold guifg=#cccccc guibg=#cd9cce
  hi! SLUnsavedFile gui=bold guifg=#cccccc guibg=#cc4a21
  hi! SLModeTerminal gui=bold guifg=#595959 guibg=#cccccc

  hi! StatusWarning gui=bold guifg=#fac863 guibg=#3e5570
  hi! StatusSuccess gui=bold guifg=#99c794 guibg=#3e5570
  hi! StatusError gui=bold guifg=#ec5f67 guibg=#3e5570

  hi! WarningMsg guifg=#fac863 ctermfg=221

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

  hi! ALEError guibg=NONE guifg=NONE
  hi! ALEWarning guibg=NONE guifg=NONE
endfunction

function! Dark()
  set background=dark
  colorscheme OceanicNext

  hi! VertSplit guibg=NONE guifg=#515966 gui=NONE term=NONE cterm=NONE
  hi! EndOfBuffer guibg=NONE guifg=#1b2b34 gui=NONE term=NONE cterm=NONE

  hi! ColorColumn guibg=#1e2d35
  hi! CursorLine guibg=#1f313a term=NONE cterm=NONE
  hi! CursorLineNr guifg=#65737e guibg=#1f313a
  hi! link CursorColumn ColorLine

  hi! Cursor ctermbg=7 guibg=#e5e5e5

  call s:custom_highlights()
endfunction

function! Bright()
  highlight clear

  set background=light
  colorscheme solarized8

  call s:custom_highlights()
endfunction

call Dark()
