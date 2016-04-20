source $HOME/.config/nvim/deps.vim
let g:data_home=expand("$HOME/.local/share/nvim")

set fileencoding=utf8 nobomb

runtime macros/matchit.vim
set showmatch

set showcmd noshowmode

set confirm

set shortmess=aI

set splitright splitbelow

set diffopt+=vertical

set number numberwidth=3

set ignorecase smartcase

set cursorline

set switchbuf=useopen,usetab,split

set list

set virtualedit=block

set complete=.,w,b,u
set tags=tags,tags.gems

set wildignorecase
set wildmode=list:longest,list:full
set wildignore=*.zip,*.gz,*.bz,*.tar
set wildignore+=*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

set nowrap

set sessionoptions=buffers,tabpages,help

set copyindent cindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab shiftround

set lazyredraw

set foldmethod=manual nofoldenable

set fileformats+=mac

set nobackup nowritebackup noswapfile

set ttimeout

let mapleader=" "

if !has('nvim')
  let g:data_home=expand("$HOME/.local/share/vim")

  scriptencoding utf8
  set encoding=utf8 termencoding=utf8 nobomb
  set autoread autowrite
  set autoindent
  set autoread
  set backspace=indent,eol,start
  set display=lastline
  set formatoptions=tcqj
  set history=10000
  set hlsearch
  set incsearch
  set langnoremap
  set laststatus=2
  set listchars="tab:> ,trail:-,nbsp:+"
  set mouse=a
  set nocompatible
  set nrformats=bin,hex
  set sessionoptions=buffers,tabpages,help
  set smarttab
  set tabpagemax=50
  set ttyfast
  set viminfo^=!
  set wildmenu
end
