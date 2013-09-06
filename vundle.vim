set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

" Tools
Bundle 'tpope/vim-surround'
Bundle 'bronson/vim-visual-star-search'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'L9'

" Snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'kassio/my-snippets'

" HTML, javascript
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'

" Ruby, rails, relatives
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'

" Elixir
Bundle 'elixir-lang/vim-elixir'

" Colorscheme
Bundle 'altercation/vim-colors-solarized'

" tmux
Bundle 'kassio/tslime.vim'

" puppet
Bundle 'rodjek/vim-puppet'
