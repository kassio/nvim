" Load submodules with pathogen
call pathogen#infect()

" Filetypes
if has("autocmd")
	filetype on
	filetype indent on
	filetype plugin on
endif

let mapleader=','

set nocompatible

scriptencoding utf8
set encoding=utf8
set fileencoding=utf8
set termencoding=utf8

set showmatch matchpairs+=<:>

set confirm

set incsearch hls ignorecase smartcase

set formatoptions=tcwqan2
set tw=90 colorcolumn=80

function! ClearTrailingSpaces()
normal mz
normal Hmy
%s/\s\+$//e
call histdel("search", -1)
normal 'yzt
normal `z
endfunction
autocmd BufWritePre * call ClearTrailingSpaces()

set lazyredraw
set showcmd

set lcs=eol:¬,tab:▸\ ,trail:·

set wildmenu wildignorecase
set wildmode=list:longest
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov

set diffopt+=iwhite

set hidden

set history=1000 undolevels=1000

set nowrap wrapscan showbreak=..

set title

set number numberwidth=5

set autoread autowrite

set switchbuf=newtab
set tabpagemax=20

set cursorline

set tag+=../.tags

set complete=.,w,b,u,kspell
set completeopt=menu,menuone,longest,preview

set timeoutlen=3000
set ttimeoutlen=50

set iskeyword+=-,?,!,@

set splitright splitbelow

set autoindent copyindent cindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=2
set noexpandtab smarttab shiftround

set backspace=indent,eol,start

set sessionoptions+=globals

set mousehide mouse=a ttymouse=xterm2

if has("gui_running")
	set guioptions-=T
	set linespace=2
	set lines=999
	set columns=9999
endif

set statusline=[%n]\ %<%.55f\ %h%w%m%r%y
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%=
set statusline+=[ASCII=%b]                                 " ASCII value of char under cursor
set statusline+=[HEX=%B]                                   " ASCII in HEX value of char under cursor
set statusline+=[%c,%l/%L]                                 " Cursor [column,line/total] lines
set statusline+=[%P]                                       " Percent through file
set statusline+=[%{GetFileSize()}]
set laststatus=2

function! GetFileSize()
let filesize = getfsize(expand('%:p'))
if filesize < 0
	return "-1"
elseif filesize < 1024
	return filesize."b"
elseif filesize >= 1048576
	return printf("%.2f", (filesize/1048576.00))."Mb"
else
	return printf("%.2f", (filesize/1024.00))."Kb"
endif
endfunction

if has("syntax")
	syntax enable
	set t_Co=256
	set background=dark
	let g:solarized_bold=1
	let g:solarized_underline=1
	let g:solarized_termcolors=256
	let g:solarized_contrast="normal"
	let g:solarized_visibility="low"
	colorscheme solarized
	let g:background_status = 1
	hi ColorColumn ctermbg=235 guibg=#262626
	hi IncSearch ctermbg=0
	hi link Comment SpecialKey
	hi link Comment NonText
	if has("folding")
		set fillchars=diff:\ ,fold:\ ,vert:\
	endif
endif

" Make Y consistent with C and D
nnoremap Y y$

" Full file indent
function! IndentAllFile()
normal mz
normal Hmy
normal gg=G
normal 'yzt
normal `z
endfunction

noremap ,ff :call IndentAllFile()<CR>

" Make <C-l> clear the highlight
nnoremap <C-L> :nohls<CR>:set hls?<CR>

" Show all buffers
nnoremap <silent> ,ls :ls!<CR>
" Delete current buffer
nnoremap <silent> ,bd :bd!<CR>
" Delete all buffers
nnoremap <silent> ,da :exec "1," . bufnr('$') . "bd"<CR>

" Toogle numbers
nnoremap <silent> ,nn :set invnumber<CR>:set nu?<CR>
" Toogle relative numbers
nnoremap <silent> ,nr :set invrelativenumber<CR>:set relativenumber?<CR>
" Toogle wrap text
nnoremap <silent> ,w :set invwrap<CR>:set wrap?<CR>
" Toogle list characters
nnoremap <silent> ,ll :set invlist<CR>:set list?<CR>
" cd to the directory containing the file in the buffer
nnoremap <silent> ,cd :lcd %:h<CR>
" make file directory(recursivily)
nnoremap <silent> ,md :!mkdir -p %:p:h<CR>

" Tabstop 2 to that filetypes
autocmd FileType vim,css,ruby,eruby,tex,c,sh,java set smarttab tabstop=2 shiftwidth=2 softtabstop=2 autoindent noexpandtab
" Tabstop 4 to that
autocmd FileType python,js,javascript set smarttab tabstop=3 shiftwidth=3 softtabstop=3 autoindent noexpandtab

" :make  Compile/Execute some filetypes
" Just a shortcut
noremap <F9> :!clear<CR>:w<CR>:make<CR>

autocmd FileType c      set makeprg=gcc\ %\ -o\ %<\ -lm"
autocmd FileType sh     set makeprg=./%
autocmd FileType cpp    noremap <F9> :call CompileCPP()<CR>
autocmd FileType ruby   set makeprg=ruby\ %
autocmd FileType perl   set makeprg=perl\ %
autocmd FileType python set makeprg=python\ %

function! CompileCPP()
if filereadable("makefile")
	exec ":!clear; make clean; make; if [ $? -eq 0 ]; then clear; echo 'SUCCESS COMPILED'; fi"
else
	echo "No make file founded"
endif
endfunction

" Spell
set spelllang=en,pt
let spell_auto_type="tex,mail,txt"
autocmd FileType tex,txt,mail,text set spell
noremap <F7> <esc>:set invspell<CR>
noremap <F6> zg
noremap <F8> z=

" Fixing some commands
cab W  w
cab Wq wq
cab wQ wq
cab WQ wq
cab Q  q

" Sorting selected text
" @shotcut ,ss
vnoremap ,ss :sort<CR>

" Get off my lawn
nnoremap <Up>     :echoe "Use k"<CR>
nnoremap <Right>  :echoe "Use l"<CR>
nnoremap <Down>   :echoe "Use j"<CR>
nnoremap <Left>   :echoe "Use h"<CR>
