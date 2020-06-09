call plug#begin('~/.config/nvim/plugged')

Plug 'kassio/neoterm'
Plug 'janko-m/vim-test'

Plug 'sheerun/vim-polyglot'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'Shougo/neco-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Theme
Plug 'sonph/onehalf', {'rtp': 'vim/'}

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

" FZF improvements
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim'

" Comments
Plug 'tpope/vim-commentary'

" Snippets
Plug 'sirver/ultisnips'

" Match pairs
Plug 'andymass/vim-matchup'

" test
Plug 'kassio/vmtest'

call plug#end()
