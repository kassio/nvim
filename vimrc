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

set formatoptions=tcwqn2
set cursorline colorcolumn=80

set lazyredraw
set showcmd

set statusline=
set statusline+=[%n]
set statusline+=\ %<%F
set statusline+=\ %y%r%m
set statusline+=\ %{&fenc!=''?&fenc:&enc}
set statusline+=\ %{&ff}
set statusline+=%=[%c,%l]\ %L
set laststatus=2

set list listchars=eol:¬,tab:▸\ ,trail:·,nbsp:·

set wildmenu wildignorecase
set wildmode=list:longest,list:full
set wildignore+=*.zip,*.gz,*.bz,*.tar
set wildignore+=*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

set diffopt+=iwhite

set nowrap wrapscan showbreak=..

set number relativenumber numberwidth=5

set autoread autowrite

set sessionoptions=buffers,curdir,localoptions,tabpages

set tags=./tags,tags,../tags,./gems.tags,gems.tags,config/gems.tags
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

set foldmethod=manual nofoldenable

set spellfile=$HOME/.vim/spell/custom.utf-8.add

if has("gui_running")
  set guioptions=ec
  set gfn=Monaco:h16
  set clipboard=unnamed
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

aug open_file_in_the_last_position
  au!
  au FileType gitcommit let b:open_at_first_line = 1
  au BufReadPost *
        \ if !exists('b:open_at_first_line') && line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute 'normal! g`"' |
        \ endif
aug END

aug retag_all_files
  au!
  au BufWritePost *
        \ if filereadable('tags') |
        \   call system('ctags -a ' . expand('%')) |
        \ endif
aug END

let mapleader=','
