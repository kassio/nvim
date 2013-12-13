source ~/.vim/vundle.vim

filetype plugin indent on

scriptencoding utf8
set encoding=utf8 fileencoding=utf8 termencoding=utf8 nobomb

set showmatch
runtime macros/matchit.vim

set confirm

set shortmess=atTI

set splitright splitbelow

set incsearch hls ignorecase smartcase

set formatoptions=tcwqnj2
set cursorline colorcolumn=80 winwidth=80

set showcmd

set switchbuf=useopen,usetab,newtab

set statusline=
set statusline+=[%n]
set statusline+=\ %<%F
set statusline+=\ %y%r%m
set statusline+=\ %{&fenc!=''?&fenc:&enc}
set statusline+=\ %{&ff}
set statusline+=%=[%c,%l]\ %L
set laststatus=2

set list listchars=tab:▸\ ,trail:·,nbsp:·

set wildmenu wildignorecase
set wildmode=list:longest,list:full
set wildignore+=*.zip,*.gz,*.bz,*.tar
set wildignore+=*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

set diffopt+=iwhite

set nowrap wrapscan showbreak=..

set number relativenumber numberwidth=3

set autoread autowrite

set sessionoptions=buffers,tabpages,curdir

set tags=tags,./tags,../tags,gems.tags,./gems.tags,../gems.tags,config/gems.tags
set complete=.,w,b,u,U,i,d,t
set completeopt=menu,menuone,longest,preview

set timeoutlen=1000 ttimeoutlen=50

set iskeyword+=-

set autoindent copyindent cindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab smarttab shiftround

set backspace=indent,eol,start

set mousehide mouse= ttymouse=xterm2

set foldmethod=manual nofoldenable

set spellfile=$HOME/.vim/spell/custom.utf-8.add

set fileformats+=mac

let mapleader=','
