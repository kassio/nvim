call plug#begin(expand('~/.nvim/plugged'))

" Tools
Plug 'kassio/vim-session_manager'
Plug 'kassio/neoterm'
Plug 'benekastah/neomake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kassio/ctrlp-bufline'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Markdown
Plug 'tpope/vim-markdown'

" textobjs
Plug 'kana/vim-textobj-user'

" Snippets
Plug 'sirver/ultisnips'

" Tomdoc
Plug 'kassio/tomdoc.vim'

" HTML, javascript, css, scss, less
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'guileen/simple-javascript-indenter'
Plug 'groenewege/vim-less'

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
