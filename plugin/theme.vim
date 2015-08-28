if has("syntax")
  syntax enable
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  colorscheme OceanicNext
  set background=dark

  set synmaxcol=500
  set colorcolumn=80

  hi! SpecialKey ctermfg=239 ctermbg=NONE guifg=Gray30 guibg=NONE

  hi! link NonText SpecialKey
  hi! VertSplit ctermbg=NONE
  hi! EndOfBuffer ctermfg=8

  hi! StatusLine ctermfg=4 ctermbg=0
  hi! StatusLineNC ctermfg=10 ctermbg=0

  hi! StatusWarning cterm=reverse ctermfg=156
  hi! StatusError cterm=reverse ctermfg=124

  " Markdown styles
  hi! link markdownItalic markdownBold
endif

command! Dark set background=dark
command! Light set background=light
