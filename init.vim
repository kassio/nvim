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
  set wildmenu
  set wildmode=list:longest
else
  set inccommand=nosplit
  set wildoptions=pum
end

set autowriteall

set fileencoding=utf8 nobomb

set showmatch noshowmode

set confirm

set shortmess=actToOFI

set splitright splitbelow

set diffopt+=vertical

set relativenumber number numberwidth=3

set ignorecase smartcase

set nocursorline

set switchbuf=useopen,usetab,split

set list

set virtualedit=block

set hidden

set updatetime=300

set signcolumn=yes

set infercase
set tags=tags,tags.gems
set tagcase=followscs

set wildignorecase

set wildignore=*.zip,*.gz,*.bz,*.tar
set wildignore+=*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

set nowrap

set sessionoptions=winpos,tabpages,help

set copyindent cindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab shiftround

set foldmethod=manual nofoldenable

set fileformats+=mac

set nobackup nowritebackup noswapfile

set ttimeout

set spell
set spelllang=en

set undofile undoreload=10000

set title
let &titlestring="%{substitute(expand('%:p'), $HOME, '$HOME', '')}"

set statusline=
set showtabline=2
set tabline=%!tabline#update()

set mouse=a

set fillchars=vert:┃

set maxmempattern=10000

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
