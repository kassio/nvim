source ~/.vim/vundle.vim

filetype plugin indent on

scriptencoding utf8
set encoding=utf8 fileencoding=utf8 termencoding=utf8 nobomb

set showmatch
runtime macros/matchit.vim

set confirm

set splitright splitbelow

set incsearch hls ignorecase smartcase

set formatoptions=tcwqn2
set cursorline colorcolumn=80

set lazyredraw
set showcmd
set statusline=%<%f%r%y%m
set statusline+=%=
set statusline+=[%c,%l]\ %L
set laststatus=2

set list listchars=eol:¬,tab:▸\ ,trail:·,nbsp:·

set wildmenu wildignorecase
set wildmode=list:longest,list:full
set wildignore+=*.zip,*.gz,*.bz,*.tar
set wildignore+=*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

set diffopt+=iwhite

set history=1000 undolevels=1000

set nowrap wrapscan showbreak=..

set number relativenumber numberwidth=5

set autoread autowrite

set tags=./tags,tags
set complete=.,w,b,u,U,i,d,t
set completeopt=menu,menuone,longest,preview

set timeoutlen=3000
set ttimeoutlen=50

set iskeyword+=-

set autoindent copyindent cindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab smarttab shiftround

set backspace=indent,eol,start

set mousehide mouse= ttymouse=xterm2

set foldmethod=manual

if has("gui_running")
  set guioptions-=T
endif

if has("syntax")
  syntax enable
  set t_Co=256
  set background=dark

  if !empty(globpath(&rtp, "colors/solarized.vim"))
    colorscheme solarized
    hi! link SpecialKey Comment
    hi! link NonText Comment
  endif
endif

aug filetype_setup
  au!
  au FileType vim,css,ruby,eruby,tex,c,sh,java,python,js,javascript set
        \ autoindent
        \ copyindent
        \ cindent
        \ smartindent
        \ tabstop=2
        \ shiftwidth=2
        \ softtabstop=2
        \ expandtab
        \ smarttab
        \ shiftround
  au FileType tex,txt,mail,text,markdown set textwidth=80
  au Filetype gitcommit set textwidth=72
  au FileType tex,txt,mail,text,markdown,gitcommit setlocal
        \ spell
        \ formatoptions+=a
  au BufNewFile,BufReadPost *.md set ft=markdown
aug END

" open file in the last position
aug last_position_on_open
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"' |
        \ endif
aug END
