if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Tools
NeoBundle 'kassio/vim-session_manager'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kassio/ctrlp-bufline.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'kassio/vim-tmux-runner'
NeoBundle 'itchyny/lightline.vim'

" Snippets
NeoBundle 'Shougo/neosnippet'

" HTML, javascript
NeoBundle 'othree/html5.vim'
NeoBundleLazy 'jelera/vim-javascript-syntax', { 'autoload': { 'filetypes': ['javascript'] } }
NeoBundleLazy 'guileen/simple-javascript-indenter', { 'autoload': { 'filetypes': ['javascript'] } }

" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'Keithbsmiley/rspec.vim'

" Elixir
NeoBundleLazy 'elixir-lang/vim-elixir', { 'autoload': { 'filetypes': ['elixir'] } }

filetype plugin indent on
NeoBundleCheck
