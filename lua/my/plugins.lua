vim.cmd 'packadd packer.nvim'

local packer = require'packer'

packer.init{ compile_path = vim.fn.stdpath('data')..'/site/plugin/packer.vim' }

return packer.startup(function()
  -- Plugin manager
  use { 'wbthomason/packer.nvim', opt = true }

  -- Generic configs
  use 'editorconfig/editorconfig' -- Load configs from .editorconfig
  use 'wsdjeg/vim-fetch' -- Open file with file_path:line:path

  -- IDE stuff
  use 'neovim/nvim-lspconfig' -- LSP
  use 'nvim-lua/completion-nvim' -- completion

  use 'nvim-lua/plenary.nvim' -- nvim lua stdlib-ish

  use 'nvim-telescope/telescope.nvim' -- Fuzzy finder
  use 'nvim-lua/popup.nvim' -- Fuzzy finder dependency

  use 'kyazdani42/nvim-tree.lua' -- file tree

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Better highlights

  use 'kassio/neoterm' -- terminal handler

  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' } -- markdown preview

  -- Test
  use 'janko-m/vim-test' -- general tests
  use 'kassio/vmtest' -- vim test framework

  -- Search/replace/text manipulation
  use 'vim-scripts/vis'
  use 'tpope/vim-repeat'
  use 'tpope/vim-abolish'

  -- Surrounding
  use 'tpope/vim-surround'
  use 'wellle/targets.vim'
  use 'kana/vim-textobj-user'

  -- Git
  use 'tpope/vim-fugitive'
  use 'mhinz/vim-signify'

  -- Comments
  use 'tpope/vim-commentary'

  -- Snippets
  use 'sirver/ultisnips'

  -- Match pairs
  use 'andymass/vim-matchup'

  -- Colors
  use { 'sonph/onehalf', rtp = 'vim/' } -- Theme
  use 'norcalli/nvim-colorizer.lua' -- colorify color strings
end)
