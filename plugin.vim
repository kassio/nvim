call plug#begin('~/.config/nvim/plugged')

Plug 'editorconfig/editorconfig' " Load configs from .editorconfig
Plug 'wsdjeg/vim-fetch' " Open file with file_path:line:path

Plug 'neovim/nvim-lspconfig' " LSP
Plug 'nvim-lua/completion-nvim' " completion

Plug 'nvim-telescope/telescope.nvim' " Fuzzy finder
Plug 'nvim-lua/popup.nvim' " Fuzzy finder dependency
Plug 'nvim-lua/plenary.nvim' " Fuzzy finder dependency
Plug 'kyazdani42/nvim-tree.lua' " file tree
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better highlights

Plug 'sonph/onehalf', {'rtp': 'vim/'} " Theme
Plug 'norcalli/nvim-colorizer.lua' " colorify color strings

Plug 'kassio/neoterm' " terminal handler

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
