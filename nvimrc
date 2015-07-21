source ~/.nvim/plug.vim

scriptencoding utf8
set fileencoding=utf8 nobomb

runtime macros/matchit.vim
set showmatch

set confirm

set shortmess=aI

set splitright splitbelow

set diffopt+=vertical

set relativenumber number numberwidth=3

set ignorecase smartcase

set cursorline

set showcmd

set switchbuf=useopen,usetab,split

set list listchars=tab:▸\ ,trail:·

set virtualedit=block

set complete=.,w,b,u
set completeopt=menu,menuone,preview,longest
set tags=tags,tags.gems

set wildignorecase
set wildignore=&completeopt
set wildignore+=*.zip,*.gz,*.bz,*.tar
set wildignore+=*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

set nowrap

set sessionoptions=buffers,tabpages,help

set copyindent cindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab shiftround

set scrolloff=3
set lazyredraw

set foldmethod=manual nofoldenable

set fileformats+=mac

set nobackup nowritebackup noswapfile

set ttimeout

let mapleader=','
