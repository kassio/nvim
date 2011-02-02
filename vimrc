" Configurations by filetype
filetype off
" Load submodules with pathogen
load pathogen managed plugins
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Plugins by filetype
filetype plugin on
" Indentation by filetype
filetype indent on
" Enable syntax
syntax on

" My world is utf8
scriptencoding utf8
set encoding=utf8
set fileencoding=utf8
set termencoding=utf8

" No want compatible with VI
set nocompatible
" Confirm before close
set confirm
" Search while type
set incsearch
" Highlight search results 
set hls
" Don't continue comments when pushing o/O
set formatoptions-=o                    
" Ignore case while search
set ignorecase
" But if have a upcase letter use case sensitive
set smartcase
" Search wrap the file
set wrapscan
" Make sure that unsaved buffers that are to be put in the background are
" Allowed to go in there (ie. the 'must save first' error doesn't come up)
set hidden
" Don't update the display while executing macros
set lazyredraw
" Show the current command in the lower right corner
set showcmd
" Hide the mouse pointer while typing
set mousehide
" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
" Make the command-line completion better
set wildmenu
" Add ignorance of whitespace to diff
set diffopt+=iwhite
" More history
set history=1000
" More undo
set undolevels=1000
" Show this when wrap a line
set showbreak=..
" File name on terminal title
set title
" Load external updates
set autoread
" Disable gui menu
set guioptions-=T
" Indent by default
set autoindent
" Copy indent in/out
set copyindent
" Enable folds
set foldenable

" My statusline
set statusline=%m                                                    " File modify signal
set statusline+=%f                                                   " Filename
"set statusline+=[%{GitBranch()}]                                    " Git
set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}        " RVM
set statusline+=%=                                                   " Separator
set statusline+=[%b]						     " ASCII value of char under cursor
set statusline+=[%c,%l/%L]                                           " Cursor [column,line/total] lines
set statusline+=\ %P                                                 " Percent through file
set laststatus=2

" Appearance
set t_Co=256
set background=dark
colorscheme xoria256

" Full copy/cut/past simple
inoremap <C-v> <ESC>"+gpa
vnoremap <C-c> "+y
vnoremap <C-x> "+x

" Make Y consistent with C and D
nnoremap Y y$

" Full file indent
noremap <C-f>f <ESC>:call FullFileIndent()<CR>
func! FullFileIndent()
	let pos = getpos(".")
	silent! normal gg=G
	call setpos(".",pos)
	echo 'All file indented'
endfunc

" Make <c-l> clear the highlight
nnoremap <C-L> :nohls<CR><C-L>
nnoremap <C-L> <C-O>:nohls<CR><C-L>

" Visual search mappings
vnoremap * :normal gD
vnoremap # :normal gd

" Foldmaps
noremap <F3> zM
noremap <F4> zR
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" Delete current buffer
nmap <silent> ,bd :bd!<CR>
" Delete all buffers
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<CR>
" Toogle numbers
nmap <silent> ,nn :set invnumber<CR>:set nu?<CR>
" Toogle relative numbers
nmap <silent> ,nr :set invrelativenumber<CR>:set relativenumber?<CR>
" Toogle wrap text
nmap <silent> ,w :set invwrap<CR>:set wrap?<CR>

" Function to change tab settings
func! ChangeTabSet(size)
	set tabstop=a:size expandtab shiftwidth=a:size softtabstop=a:size autoindent
endfunc

" Tabstop 2 to that filetypes
autocmd FileType css,ruby,eruby,tex,c,sh,java call ChangeTabSet(2)
" Tabstop 4 to that
autocmd FileType python,js,javascript call ChangeTabSet(4)

" :make  Compile/Execute some filetypes
autocmd FileType c      set makeprg=gcc\ %\ -o\ %<\ -lm"
autocmd FileType cpp    set makeprg=g++\ %\ -o\ %<\ -lm"
autocmd FileType ruby   set makeprg=ruby\ %
autocmd FileType python set makeprg=python\ %
" Just a shortcut
map <F9> :w<CR>:make<CR>

""""""""""""""" PLUGINS CONFIGURATION

" ColorSelect
let g:CaseResultColorSelect=‘upcase’
imap <F5> :ColorSelect<CR>
