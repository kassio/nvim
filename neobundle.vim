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
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'scrooloose/nerdtree'

" Snippets
NeoBundle 'Shougo/neosnippet'

" HTML, javascript
NeoBundle 'othree/html5.vim'
NeoBundleLazy 'jelera/vim-javascript-syntax', { 'autoload': { 'filetypes': ['javascript'] } }
NeoBundle 'guileen/simple-javascript-indenter'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'Keithbsmiley/rspec.vim'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'kana/vim-textobj-user'

" Elixir
NeoBundle 'elixir-lang/vim-elixir'

" Colorscheme
NeoBundle 'altercation/vim-colors-solarized'

" tmux
NeoBundle 'kassio/vim-tmux-runner'

filetype plugin indent on
NeoBundleCheck
