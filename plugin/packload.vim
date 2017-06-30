packloadall

aug user:packload
  au!
  au Filetype vim packadd neco-vim
  au Filetype ruby,eruby packadd deoplete-ruby
  au Filetype ruby packadd rspec.vim
  au Filetype ruby packadd vim-ruby-minitest
  au Filetype ruby,javascript packadd tomdoc.vim
aug END
