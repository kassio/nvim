" Global
set autowriteall
set nobackup
set completeopt=menuone,noinsert,noselect
set confirm
set diffopt=internal,filler,closeoff,vertical
set fileencodings=utf8,nobomb
set fileformats=unix,mac
set fillchars=vert:│
set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:hor20
set ignorecase
set inccommand=nosplit
set mouse=a
set secure
set sessionoptions=winpos,tabpages,help
set shiftround
set shortmess=actToOFI
set showmatch
set noshowmode
set showtabline=2
set smartcase
set splitbelow
set splitright
set switchbuf=useopen,usetab,split
set tags=
set termguicolors
set title
set titlestring="%{substitute(expand('%:p'), $HOME, '$HOME', '')}"
set undolevels=10000
set undoreload=10000
set virtualedit=block
set wildignorecase
set wildoptions=pum
set nowritebackup
set scrolloff=10
set cindent
set complete=.,w,b,u
set copyindent
set expandtab
set infercase
set shiftwidth=2
set smartindent
set softtabstop=2
set spelllang=en
set noswapfile
set tabstop=2
set textwidth=100
set undofile
set dictionary=/usr/share/dict/words

" Window
set colorcolumn=80,100,120
set nofoldenable
set foldmethod=manual
set list
set listchars=tab:>\ ,trail:-,nbsp:+,precedes:<,extends:>
set number
set numberwidth=5
set relativenumber
set signcolumn=yes
set spell
set nowrap

lua <<EOL
local command = vim.cmd
local fn = vim.fn
local packer_path = '/site/pack/packer/opt/packer.nvim'
local install_path = fn.stdpath('data') .. packer_path

if fn.empty(fn.glob(install_path)) > 0 then
  command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  command('packadd packer.nvim')
end

vim.my = {}

-- P = Print with inpect
P = function(anything)
  print(vim.inspect(anything))
end

-- R = Reload
-- Reloads a package by name
-- If it fails to be loaded the error is printed
R = function(name)
  package.loaded[name] = nil
  local status, result = pcall(require, name)

  if status then
    return result -- package
  else
    print('Failed to load '..name)
    print(result) -- error message
  end
end

-- settings
R'my/global'
R'my/keymap'
R'my/autocmd'
R'my/command'
R'my/tabline'

-- libs
R'terminal'.setup()
R'colorizer'.setup()
R'my/plugin/fuzzyfinder'
R'my/plugin/file-tree'
R'my/plugin/completion'
R'my/plugin/treesitter'
R'my/plugin/lspinstall'
R'my/plugin/lspconfig'
R'my/plugin/git-signs'
EOL
