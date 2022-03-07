local M = {}

M.setup = function()
  local fn = vim.fn
  local repo = 'https://github.com/wbthomason/packer.nvim'
  local path = string.format('%s/site/pack/packer/opt/packer.nvim', fn.stdpath('data'))

  if fn.empty(fn.glob(path)) > 0 then
    fn.system(string.format('git clone %s %s', repo, path))

    vim.cmd('qall!')
  end

  vim.my.utils.command('-bang Upgrade lua require("plugins").upgrade("<bang>")')
end

M.upgrade = function(bang)
  if tostring(bang) == '!' then
    vim.cmd('autocmd User PackerComplete quitall')
  end

  M.load().sync()
end

M.load = function()
  vim.cmd('packadd packer.nvim')

  local packer = require('packer')

  packer.init({ compile_path = vim.fn.stdpath('data') .. '/site/plugin/packer.vim' })

  return packer.startup({
    function(use)
      -- Packer can manage itself
      use({ 'wbthomason/packer.nvim', opt = true })

      -- Statusline
      use('nvim-lualine/lualine.nvim')

      -- Project management
      use('tpope/vim-projectionist')

      -- Load configs from .editorconfig
      use('gpanders/editorconfig.nvim')

      -- Open file with file_path:line:path
      use('wsdjeg/vim-fetch')

      -- Comment management
      use('numToStr/Comment.nvim')

      -- Replace variantions of a word
      use('tpope/vim-abolish')

      -- Surround chars handling
      use({
        'tpope/vim-surround',
        'wellle/targets.vim',
        'tpope/vim-repeat', -- Enables repeat surround movements
      })

      -- File tree
      use({
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
      })

      -- Icons
      use('kyazdani42/nvim-web-devicons')

      -- Fuzzy Finder
      use({
        'junegunn/fzf',
        run = ':call fzf#install()',
        requires = {
          'junegunn/fzf.vim',
        },
      })

      -- Treesitter
      use({
        { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/nvim-treesitter-refactor',
        'nvim-treesitter/playground',
        'lewis6991/spellsitter.nvim',
        'SmiteshP/nvim-gps',
      })

      -- LSP
      use({
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
        -- generic LSP for diagnostic, formatting, etc
        'jose-elias-alvarez/null-ls.nvim',
      })

      -- Git
      use({
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
      })

      -- Completion
      use({
        'hrsh7th/nvim-cmp',
        requires = {
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-nvim-lua',
          'f3fora/cmp-spell',
          'onsails/lspkind-nvim',
          'ray-x/cmp-treesitter',
          -- snippets
          'dcampos/nvim-snippy',
          'dcampos/cmp-snippy',
        },
      })

      -- fancy notification
      use('rcarriga/nvim-notify')

      -- terminal handling
      use('kassio/neoterm')

      -- Split/Join commands
      use('AndrewRadev/splitjoin.vim')

      -- Better pairs matching
      use('andymass/vim-matchup')

      -- Test runner
      use('kassio/vim-test')

      -- Colors
      use({
        -- 'marko-cerovac/material.nvim', -- Theme
        'norcalli/nvim-colorizer.lua', -- Highlight color strings
        'norcalli/nvim-terminal.lua', -- Fix terminal colors
        'tjdevries/colorbuddy.nvim', -- Colors helpers
        'Th3Whit3Wolf/onebuddy', -- Theme
        'https://gitlab.com/yorickpeterse/nvim-pqf.git', -- Prettier qf/loc windows
      })

      -- Better language support
      use('euclidianAce/BetterLua.vim') -- Lua
      use('google/vim-jsonnet') -- Jsonnet
      use('jparise/vim-graphql') -- Graphql
      use('stephenway/postcss.vim') -- Postcss
      use('tpope/vim-git') -- Postcss
    end,
    config = {
      display = {
        open_fn = require('packer.util').float,
      },
    },
  })
end

return M
