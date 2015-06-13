source ~/.nvim/plug.vim

scriptencoding utf8
set fileencoding=utf8 nobomb

runtime macros/matchit.vim
set showmatch

set confirm

set shortmess=aI

set splitright splitbelow

set diffopt+=vertical

set number numberwidth=3

set incsearch hls ignorecase smartcase

set cursorline

set showcmd

set switchbuf=useopen,usetab,split
set tabpagemax=50

set list listchars=tab:▸\ ,trail:·

set virtualedit=block

set complete=.,w,b,u,i
set completeopt=menu,menuone,preview,longest

set wildignorecase
set wildignore=&completeopt
set wildignore+=*.zip,*.gz,*.bz,*.tar
set wildignore+=*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

set nowrap wrapscan showbreak=..

set autoread autowrite

set viminfo^=!

set sessionoptions=buffers,tabpages,help

set noesckeys ttimeout ttimeoutlen=1 timeoutlen=280

set autoindent copyindent cindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab smarttab shiftround

set mousehide mouse=a

set scrolloff=3
set lazyredraw

set foldmethod=manual nofoldenable

set fileformats+=mac

set nobackup nowritebackup noswapfile

let mapleader=','
