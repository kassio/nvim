let $MYVIM = "$HOME/.config/nvim"
source $MYVIM/packs.vim
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

runtime defaults.vim

if !has('nvim')
  let $MYVIM = "$HOME/.vim"
  unlet! skip_defaults_vim
  source $VIMRUNTIME/defaults.vim

  packadd matchit

  scriptencoding utf8

  set encoding=utf8 termencoding=utf8 nobomb
  set autoread autowriteall
  set autoindent
  set autoread
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
end

if has('nvim')
  set inccommand=nosplit
end

set fileencoding=utf8 nobomb

set showmatch showcmd noshowmode

set sessionoptions=tabpages

set confirm

set shortmess=aI

set splitright splitbelow

set diffopt+=vertical

set relativenumber number numberwidth=3

set ignorecase smartcase

set cursorline

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

set sessionoptions=buffers,tabpages,help

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
let &undodir=expand('%:p:h')."/._v-undo"

set statusline=
set tabline=%!tabline#update()

set mouse=a

let &grepformat='%f:%l:%c:%m,%f:%l:%m'
let &grepprg="rg --follow --smart-case --vimgrep"

let mapleader=" "

" Disable standard plugins
let g:loaded_vimballPlugin=1
let g:loaded_zipPlugin=1
let loaded_gzip=1
let g:loaded_tarPlugin=1
let g:loaded_netrwPlugin=1
let g:loaded_getscriptPlugin=1
let loaded_rrhelper=1
