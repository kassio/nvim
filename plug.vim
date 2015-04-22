call plug#begin(expand('~/.nvim/plugged'))

" Tools
Plug 'kassio/vim-session_manager'
Plug 'kassio/ctrlp-bufline'
Plug 'kassio/neoterm'
Plug 'benekastah/neomake'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Markdown
Plug 'tpope/vim-markdown'

" textobjs
Plug 'kana/vim-textobj-user'

" Snippets
Plug 'sirver/ultisnips'

" Tomdoc
Plug 'wellbredgrapefruit/tomdoc.vim'

" HTML, javascript
Plug 'othree/html5.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'guileen/simple-javascript-indenter'

" react.js
Plug 'mxw/vim-jsx'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'Keithbsmiley/rspec.vim'

" Elixir
Plug 'elixir-lang/vim-elixir'

" Puppet
Plug 'rodjek/vim-puppet'

call plug#end()

filetype plugin indent on
