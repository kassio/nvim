call plug#begin('~/.config/nvim/plugged')

Plug 'editorconfig/editorconfig' " Load configs from .editorconfig
Plug 'wsdjeg/vim-fetch' " Open file with file_path:line:path

Plug 'neovim/nvim-lspconfig' " LSP

Plug 'nvim-lua/completion-nvim' " completion

Plug 'kyazdani42/nvim-tree.lua' " file tree

Plug 'sonph/onehalf', {'rtp': 'vim/'} " Theme
Plug 'norcalli/nvim-colorizer.lua' " colorify color strings

Plug 'kassio/neoterm' " terminal handler

Plug 'sheerun/vim-polyglot' " most langs
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } "markdown preview

Plug 'janko-m/vim-test' " general tests
Plug 'kassio/vmtest' " vim test framework

" Search/replace/text manipulation
Plug 'vim-scripts/vis'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'

" Surrounding
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Comments
Plug 'tpope/vim-commentary'

" Snippets
Plug 'sirver/ultisnips'

" Match pairs
Plug 'andymass/vim-matchup'

call plug#end()
