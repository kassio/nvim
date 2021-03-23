pcall(vim.cmd, 'packadd packer.nvim')

local packer = require'packer'

packer.init{ compile_path = vim.fn.stdpath('data')..'/site/plugin/packer.vim' }

return packer.startup{
  function(use)
    -- Plugin manager
    use { 'wbthomason/packer.nvim', opt = true }

    -- Generic configs
    use 'editorconfig/editorconfig' -- Load configs from .editorconfig
    use 'wsdjeg/vim-fetch' -- Open file with file_path:line:path

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Statusline
    use 'hoob3rt/lualine.nvim'

    -- IDE stuff
    use 'kassio/neoterm' -- terminal handler
    use 'jparise/vim-graphql' -- graphql
    use 'neovim/nvim-lspconfig' -- LSP
    use 'hrsh7th/nvim-compe' -- completion

    -- Better lua colors
    use 'euclidianAce/BetterLua.vim'

    -- Fuzzy finder
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-fzy-native.nvim'
      }
    }

    use 'kyazdani42/nvim-tree.lua' -- file tree

    -- AST based plugins
    use {
      { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-textobjects'
    }

    -- Test
    use 'janko-m/vim-test' -- general tests
    use 'kassio/vmtest' -- vim test framework

    -- Text manipulation
    -- Search/replace/text manipulation
    use 'vim-scripts/vis'
    use 'tpope/vim-repeat'
    use 'tpope/vim-abolish'

    -- Tabularize
    use 'godlygeek/tabular'

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
    use 'sirver/ultisnips' -- requires Python

    -- Match pairs
    use 'andymass/vim-matchup'

    -- Colors
    -- Theme
    use { 'sonph/onehalf', rtp = 'vim/' }
    -- colorify color strings
    use 'norcalli/nvim-colorizer.lua'
  end
}
