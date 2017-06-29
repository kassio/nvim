packloadall

aug user:packload
  au!
  au Filetype vim packadd neco-vim
  au Filetype ruby,eruby packadd deoplete-ruby
  au Filetype markdown packadd vim-markdown
  au Filetype html,eruby packadd html5.vim
  au Filetype javascript,html,eruby,jsx packadd yajs.vim
  au Filetype jsx packadd vim-jsx
  au Filetype ruby,eruby packadd vim-ruby
  au Filetype ruby packadd rspec.vim
  au Filetype ruby packadd vim-ruby-minitest
  au Filetype elixir,eelixir packadd vim-elixir
  au Filetype ruby,javascript packadd tomdoc.vim
aug END
