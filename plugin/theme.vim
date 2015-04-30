if has("syntax")
  syntax enable
  set background=dark
  set t_Co=256
  set synmaxcol=500
  set colorcolumn=80

  colorscheme solarized

  hi! SpecialKey ctermfg=239 ctermbg=NONE guifg=Gray30 guibg=NONE

  hi! link NonText SpecialKey
  hi! VertSplit ctermbg=NONE

  hi! StatusLine ctermfg=4 ctermbg=0
  hi! StatusLineNC ctermfg=10 ctermbg=0

  " Statusline section colors
  hi User1 term=reverse cterm=reverse ctermfg=1 ctermbg=14 gui=bold,reverse

  " Markdown styles
  hi! link markdownItalic markdownBold
endif

command! Dark set background=dark
command! Light set background=light
