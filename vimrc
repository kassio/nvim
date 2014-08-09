source ~/.vim/neobundle.vim

scriptencoding utf8
set encoding=utf8 fileencoding=utf8 termencoding=utf8 nobomb

set showmatch
runtime macros/matchit.vim

set ttyfast

set confirm

set shortmess=atTI

set splitright splitbelow

set diffopt+=vertical

set number relativenumber numberwidth=3

set incsearch hls ignorecase smartcase

set formatoptions=tcwqnj2
set cursorline colorcolumn=80

set nrformats-=octal

set showcmd

set switchbuf=useopen,usetab,newtab
set tabpagemax=50

set list listchars=tab:▸\ ,trail:·

set virtualedit=block

set wildmenu wildignorecase
set wildmode=list:longest,list:full
set wildignore+=*.zip,*.gz,*.bz,*.tar
set wildignore+=*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

set nowrap wrapscan showbreak=..

set autoread autowrite

set viminfo^=!

set sessionoptions=buffers,tabpages,curdir

set tags=tags,../tags,config/tags
set tags+=gems.tags,../gems.tags,config/gems.tags
set complete=.,w,b,u,U,i,d
set completeopt=menu,menuone,longest,preview

set timeoutlen=1000 ttimeout ttimeoutlen=50

set autoindent copyindent cindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab smarttab shiftround

set backspace=indent,eol,start

set mousehide mouse=a ttymouse=xterm2

set scrolloff=3

set foldmethod=manual nofoldenable

set spellfile=~/.vim/spell/custom.utf-8.add

set fileformats+=mac

set t_ti= t_te= t_ut=

set nobackup nowritebackup noswapfile

let mapleader=','
