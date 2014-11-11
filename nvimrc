source ~/.nvim/neobundle.vim

scriptencoding utf8
set encoding=utf8 fileencoding=utf8 termencoding=utf8 nobomb

runtime macros/matchit.vim
set showmatch

set confirm

set shortmess=aI

set splitright splitbelow

set diffopt+=vertical

set number numberwidth=3

set incsearch hls ignorecase smartcase

set formatoptions=tcwqnj2
set cursorline

set nrformats-=octal

set showcmd

set switchbuf=useopen,usetab,newtab
set tabpagemax=50

set list listchars=tab:▸\ ,trail:·

set virtualedit=block

set complete=.,w,b,u,i
set completeopt=menu,menuone,preview,longest
set tags=tags,tags.gems

set wildmenu wildignorecase
set wildmode=list:longest,list:full
set wildignore=&completeopt
set wildignore+=*.zip,*.gz,*.bz,*.tar
set wildignore+=*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

set nowrap wrapscan showbreak=..

set autoread autowrite

set viminfo^=!

set sessionoptions=buffers,tabpages,help

set noesckeys ttimeout ttimeoutlen=1 timeoutlen=250

set autoindent copyindent cindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab smarttab shiftround

set backspace=indent,eol,start

set mousehide mouse=a ttymouse=xterm2

set scrolloff=3
set lazyredraw ttyscroll=3

set foldmethod=manual nofoldenable

set fileformats+=mac

set t_ti= t_te= t_ut=

set nobackup nowritebackup noswapfile

let mapleader=','
