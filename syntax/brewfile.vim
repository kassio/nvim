if exists("b:current_syntax")
  finish
endif

" Load ruby syntax
source $VIMRUNTIME/syntax/ruby.vim
unlet b:current_syntax

syn keyword Brewfile_tap tap
syn keyword Brewfile_brew brew
syn keyword Brewfile_cask cask

hi def link Brewfile_tap Keyword
hi def link Brewfile_brew Function
hi def link Brewfile_cask Special

let b:current_syntax = 'brewfile'
