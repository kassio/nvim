call plug#begin(expand('~/.config/nvim/_deps'))

" Tools
Plug 'kassio/vim-session_manager'
Plug 'kassio/neoterm'
Plug 'benekastah/neomake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeMirror'] }
Plug 'mhartington/oceanic-next'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'kassio/ctrlp-bufline'
Plug 'kana/vim-textobj-user'
Plug 'wellle/targets.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

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

command! Pupgrade PlugUpgrade | PlugUpdate
