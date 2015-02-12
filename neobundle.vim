if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Tools
NeoBundle 'kassio/vim-session_manager'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'kassio/vim-tmux-runner'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'rking/ag.vim'
NeoBundle 'kassio/better_tags_completion.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'kassio/ctrlp-bufline.vim'

" textobjs
NeoBundle 'kana/vim-textobj-user'

" Snippets
NeoBundle 'sirver/ultisnips'

" Tomdoc
NeoBundle 'wellbredgrapefruit/tomdoc.vim'

" HTML, javascript
NeoBundle 'othree/html5.vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'guileen/simple-javascript-indenter'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Keithbsmiley/rspec.vim'

" Elixir
NeoBundle 'elixir-lang/vim-elixir'

" Puppet
NeoBundle 'rodjek/vim-puppet', {
      \ 'autoload': { 'filetypes': ['puppet'] }
      \ }

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
