set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle
Bundle 'gmarik/vundle'

" Tools
Bundle 'tpope/vim-surround'
Bundle 'bronson/vim-visual-star-search'
Bundle 'godlygeek/tabular'
Bundle 'kana/vim-textobj-user'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'tomtom/quickfixsigns_vim'
Bundle 'scrooloose/syntastic'
Bundle 'L9'

" Snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'kassio/my-snippets'

" HTML, javascript
Bundle 'othree/html5.vim'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'pangloss/vim-javascript'

" Ruby, rails, relatives
Bundle 'vim-ruby/vim-ruby'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'

" Colorscheme
Bundle 'altercation/vim-colors-solarized'
