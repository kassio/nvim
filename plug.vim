call plug#begin(expand('~/.nvim/plugged'))

" Tools
Plug 'kassio/vim-session_manager'
Plug 'kassio/neoterm'
Plug 'benekastah/neomake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeMirror'] }
Plug 'ryanoasis/vim-devicons', { 'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeMirror'] }
Plug 'mhartington/oceanic-next'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kassio/ctrlp-bufline'
Plug 'pbrisbin/vim-mkdir'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" textobjs
Plug 'kana/vim-textobj-user'

" Snippets
Plug 'sirver/ultisnips'

" Tomdoc
Plug 'wellbredgrapefruit/tomdoc.vim'

" Markdown
Plug 'tpope/vim-markdown'

" HTML, javascript, css, scss, less
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
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
