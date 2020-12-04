scriptencoding utf8

lua require'my/setup'.setup()

syntax sync minlines=512

set termguicolors
set lazyredraw
set regexpengine=2
set colorcolumn=80,100,120
set synmaxcol=200

set inccommand=nosplit
set wildoptions=pum
set completeopt=menuone,noinsert,noselect

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
set textwidth=100
set sidescroll=5

set list
set listchars+=precedes:<,extends:>

set sessionoptions=winpos,tabpages,help

set copyindent cindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set expandtab shiftround

set foldmethod=manual nofoldenable

set fileformats+=mac

set nobackup nowritebackup noswapfile

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

" global signs icons
let g:sign_error = '×'
let g:sign_warning = '⚠'
let g:sign_info = 'ⅰ'
