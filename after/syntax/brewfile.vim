if exists('b:current_syntax')
  finish
endif

" Load ruby syntax
source $VIMRUNTIME/syntax/ruby.vim
unlet b:current_syntax

syn keyword Brewfile_tap tap
syn keyword Brewfile_brew brew
syn keyword Brewfile_cask cask
syn keyword Brewfile_mas mas

hi def link Brewfile_tap Statement
hi def link Brewfile_brew Function
hi def link Brewfile_cask Number
hi def link Brewfile_mas Keyword

let b:current_syntax = 'brewfile'
