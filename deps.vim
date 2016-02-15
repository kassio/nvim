call plug#begin(expand('~/.config/nvim/_deps'))

" Tools
Plug 'git@github.com:kassio/vim-session_manager.git'
Plug 'git@github.com:kassio/neoterm.git'
Plug 'benekastah/neomake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTree', 'NERDTreeToggle', 'NERDTreeMirror'] }
Plug 'mhartington/oceanic-next'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'git@github.com:kassio/ctrlp-bufline.vim.git'
Plug 'kana/vim-textobj-user'
Plug 'wellle/targets.vim'

Plug 'junegunn/vader.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Snippets
Plug 'sirver/ultisnips'

" Tomdoc
Plug 'wellbredgrapefruit/tomdoc.vim'

" Markdown
Plug 'tpope/vim-markdown', { 'for': ['markdown'] }

" HTML, javascript, css, scss, less
Plug 'othree/html5.vim', { 'for': ['html', 'eruby'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html', 'eruby'] }

" react.js
Plug 'mxw/vim-jsx'

" Ruby
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby'] }
Plug 'Keithbsmiley/rspec.vim', { 'for': ['ruby'] }
Plug 'sunaku/vim-ruby-minitest', { 'for': ['ruby'] }

" Elixir
Plug 'git@github.com:elixir-lang/vim-elixir.git', { 'for': ['elixir', 'eelixir'] }

call plug#end()

filetype plugin indent on

command! Pupgrade PlugUpgrade | PlugUpdate
