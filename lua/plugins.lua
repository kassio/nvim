local M = {}

M.setup = function()
  local fn = vim.fn
  local repo = 'https://github.com/wbthomason/packer.nvim'
  local path = string.format('%s/site/pack/packer/opt/packer.nvim', fn.stdpath('data'))

  if fn.empty(fn.glob(path)) > 0 then
    fn.system(string.format('git clone %s %s', repo, path))

    vim.cmd('qall!')
  end

  vim.my.utils.command("-bang Upgrade lua R('plugins').upgrade({ lsp = '<bang>' })")
end

-- Upgrade plugins
M.upgrade = function(opts)
  opts = opts or {}

  M.load()

  require('packer').sync()

  if (opts.lsp or '') ~= '' then
    local ok, lspinstaller = pcall(require, 'plugins.lsp.installer')
    if ok then lspinstaller.installAll() end
  end
end

M.load = function()
  vim.cmd('packadd packer.nvim')

  local packer = require('packer')

  packer.init{ compile_path = vim.fn.stdpath('data')..'/site/plugin/packer.vim' }

  return packer.startup{
    function(use)
      -- Packer can manage itself
      use { 'wbthomason/packer.nvim', opt = true }

      -- Statusline
      use 'hoob3rt/lualine.nvim'

      -- Project management
      use 'tpope/vim-projectionist'

      -- Load configs from .editorconfig
      use 'editorconfig/editorconfig'

      -- Open file with file_path:line:path
      use 'wsdjeg/vim-fetch'

      -- Comment management
      use 'tpope/vim-commentary'

      -- Surround chars handling
      use {
        'tpope/vim-surround',
        'wellle/targets.vim'
      }

      -- File tree
      use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
      }

      -- Icons
      use 'kyazdani42/nvim-web-devicons'

      -- Fuzzy Finder
      use {
        'nvim-telescope/telescope.nvim',
        requires = {
          'nvim-lua/popup.nvim',
          'nvim-lua/plenary.nvim',
          'nvim-telescope/telescope-fzy-native.nvim'
        }
      }

      -- Indentation marks
      use 'lukas-reineke/indent-blankline.nvim'

      -- Treesitter
      use {
        { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/nvim-treesitter-refactor',
        'nvim-treesitter/playground',
        'lewis6991/spellsitter.nvim'
      }

      -- LSP
      use {
        'neovim/nvim-lspconfig',
        -- 'kabouzeid/nvim-lspinstall'
        'kassio/nvim-lspinstall'
      }

      -- Git
      use {
        'tpope/vim-fugitive',
        {
          'lewis6991/gitsigns.nvim',
          requires = 'nvim-lua/plenary.nvim'
        },
      }

      -- Snippets
      use {
        'hrsh7th/vim-vsnip',
        'rafamadriz/friendly-snippets',
      }

      -- Completion
      use {
        'hrsh7th/nvim-cmp',
        requires = {
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-nvim-lua',
          'hrsh7th/cmp-vsnip',
          'f3fora/cmp-spell',
          'onsails/lspkind-nvim'
        }
      }

      -- terminal handling
      use 'kassio/neoterm'

      -- Split/Join commands
      use 'AndrewRadev/splitjoin.vim'

      -- Test runner
      use 'janko-m/vim-test'

      -- Colors
      use {
        'marko-cerovac/material.nvim', -- Theme
        'norcalli/nvim-colorizer.lua', -- Highlight color strings
        'norcalli/nvim-terminal.lua', -- Fix terminal colors
        'tjdevries/colorbuddy.nvim', -- Colors helpers
      }

      -- Better language support
      use 'euclidianAce/BetterLua.vim' -- Lua
      use 'google/vim-jsonnet' -- Jsonnet
      use 'jparise/vim-graphql' -- Graphql
      use 'stephenway/postcss.vim' -- Postcss
      use 'tpope/vim-git' -- Postcss
    end,
    config = {
      display = { open_fn = R('packer.util').float }
    }
  }
end

return M
