call plug#begin('~/.config/nvim/plugged')

Plug 'editorconfig/editorconfig' " Load configs from .editorconfig
Plug 'wsdjeg/vim-fetch' " Open file with file_path:line:path

Plug 'kassio/neoterm'

" test
Plug 'janko-m/vim-test' " general
Plug 'kassio/vmtest' " vim test framework

Plug 'norcalli/nvim-colorizer.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'sheerun/vim-polyglot' " most langs
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } "markdown
Plug 'Shougo/neco-vim' " vim

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

call plug#end()
