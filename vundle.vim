set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

" Tools
Bundle 'L9'
Bundle 'bronson/vim-visual-star-search'
Bundle 'kien/ctrlp.vim'
Bundle 'kassio/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'kassio/vim-session_manager'
Bundle 'Yggdroot/indentLine'

" Snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'kassio/my-snippets'

" HTML, javascript
Bundle 'othree/html5.vim'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'Keithbsmiley/rspec.vim'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-user'

" Elixir
Bundle 'elixir-lang/vim-elixir'

" Colorscheme
Bundle 'altercation/vim-colors-solarized'

" tmux
Bundle 'kassio/tslime.vim'

" tagbar
Bundle 'majutsushi/tagbar'
