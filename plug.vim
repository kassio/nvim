call plug#begin(expand('~/.nvim/plugged'))

" Tools
Plug 'kassio/vim-session_manager'
Plug 'kassio/neoterm'
Plug 'benekastah/neomake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeMirror'] }
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kassio/ctrlp-bufline'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" textobjs
Plug 'kana/vim-textobj-user'

" Snippets
Plug 'sirver/ultisnips'

" Tomdoc
Plug 'kassio/tomdoc.vim'

" Markdown
Plug 'tpope/vim-markdown', { 'for': 'markdown' }

" HTML, javascript, css, scss, less
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'guileen/simple-javascript-indenter', { 'for': 'javascript' }
Plug 'groenewege/vim-less', { 'for': 'less' }

" react.js
Plug 'mxw/vim-jsx'

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'Keithbsmiley/rspec.vim', { 'for': 'ruby' }

" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir,elixirc' }

" Puppet
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }

call plug#end()

filetype plugin indent on
