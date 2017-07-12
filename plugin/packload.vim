packloadall

aug user:packload
  au!
  au BufReadPre *.vim packadd neco-vim
  au BufReadPre *.rb packadd rspec.vim
  au BufReadPre *.rb packadd vim-ruby-minitest
  au BufReadPre *.rb,*.js packadd tomdoc.vim
  au BufReadPre *.rb,*.erb packadd deoplete-ruby
aug END
