if !has('nvim')
  unlet! g:skip_defaults_vim
  source $VIMRUNTIME/defaults.vim

  packadd matchit

  set encoding=utf8 termencoding=utf8 nobomb
  scriptencoding utf8

  set autoread autowriteall
  set autoindent
  set display=lastline
  set formatoptions=tcqj
  set history=10000
  set hlsearch
  set laststatus=2
  set listchars=tab:>\ ,trail:-,nbsp:+
  set smarttab
  set tabpagemax=50
  set ttyfast
  set viminfo^=!
  set belloff=all
else
  set inccommand=nosplit
end

set autowriteall

set fileencoding=utf8 nobomb

set showmatch noshowmode

set confirm

set shortmess=aI

set splitright splitbelow

set diffopt+=vertical

set relativenumber number numberwidth=3

set ignorecase smartcase

set nocursorline

set switchbuf=useopen,usetab,split

set list

set virtualedit=block

set complete=.,w,b,u,i,t
set completeopt=menu,menuone,preview,noinsert,noselect
set infercase
set tags=tags,tags.gems
set tagcase=followscs

set wildignorecase
set wildmode=list:longest,list:full
set wildignore=*.zip,*.gz,*.bz,*.tar
set wildignore+=*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

set nowrap

set sessionoptions=winpos,tabpages,help

set copyindent cindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab shiftround

set lazyredraw

set foldmethod=manual nofoldenable

set fileformats+=mac

set nobackup nowritebackup noswapfile

set ttimeout

set spelllang=en,pt
set spell

set undofile undoreload=10000

set title
let &titlestring="%{substitute(expand('%:p'), $HOME, '$HOME', '')}"

set statusline=
set showtabline=2
set tabline=%!tabline#update()

set mouse=a
set guicursor=n-c-v:block-Cursor/Cursor-blinkon0
set guicursor+=i-ci:ver1-Cursor/Cursor-blinkwait200-blinkon200-blinkoff150
set guicursor+=r-cr-o:hor1-Cursor/Cursor-blinkwait200-blinkon200-blinkoff150

set fillchars+=vert:│

let &grepformat='%f:%l:%c:%m,%f:%l:%m'
let &grepprg='ag --follow --smart-case --vimgrep --skip-vcs-ignores --hidden --nocolor'

let g:mapleader=' '

" Disable standard plugins
let g:loaded_getscriptPlugin = 1
let g:loaded_netrwPlugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1
let g:loaded_gzip = 1
let g:loaded_rrhelper = 1
