" configurations by filetype
filetype on
" plugins by filetype
filetype plugin on
" indentation by filetype
filetype indent on

" confirm before close
set confirm
" search while type
set incsearch
" ignore case while search
set ignorecase
" but if have a upcase letter use case sensitive
set smartcase
" search wrap the file
set wrapscan
" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden
" Don't update the display while executing macros
set lazyredraw
" Show the current command in the lower right corner
set showcmd
" Show the current mode
set showmode
" Hide the mouse pointer while typing
set mousehide
" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
" Make the command-line completion better
" set wildmenu
" "
