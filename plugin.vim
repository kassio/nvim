call plug#begin('~/.config/nvim/plugged')

Plug 'k-takata/minpac'

Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'

Plug 'Shougo/neco-vim'

Plug 'sheerun/vim-polyglot'

Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Theme
Plug 'joshdick/onedark.vim'

" Linting
Plug 'w0rp/ale'

" Search/replace/text manipulation
Plug 'vim-scripts/vis'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'

" Surrounding
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'

" File tree
Plug 'preservim/nerdtree'

" FZF improvements
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim'

" Comments
Plug 'tpope/vim-commentary'

" Snippets
Plug 'sirver/ultisnips'

" Tomdoc
Plug 'kassio/tomdoc.vim'

" Match pairs
Plug 'andymass/vim-matchup'

call plug#end()
