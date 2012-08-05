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
set tw=120 colorcolumn=110

set lazyredraw
set showcmd

set mousehide mouse=a

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

set foldenable
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

set cursorline

set complete=.,w,b,u,kspell
set completeopt=menu,menuone,longest,preview

set timeoutlen=3000
set ttimeoutlen=50

set iskeyword+=-

set splitright splitbelow

set autoindent copyindent cindent smartindent
set tabstop=2 shiftwidth=2 softtabstop=2 
set nojoinspaces expandtab smarttab shiftround

set grepprg="ack -H -i --column --follow"

set backspace=indent,eol,start

set sessionoptions+=globals

set term=builtin_ansi

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
  hi ColorColumn ctermbg=235 guibg=#262626
  let g:background_status = 1
  if has("folding")
    set fillchars=diff:\ ,fold:\ ,vert:\ 
  endif
endif

" Make Y consistent with C and D
nnoremap Y y$

" Full file indent
noremap ,ff <ESC>:normal mzgg=G`z<CR>

" Make <C-l> clear the highlight
nnoremap <C-L> :nohls<CR>:set hls?<CR>

" Foldmaps
noremap <F3> zM
noremap <F4> zR
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" Show all buffers
nmap <silent> ,ls :ls!<CR>
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
" Toogle list characters
nmap <silent> ,ll :set invlist<CR>:set list?<CR>
" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
" make file directory(recursivily)
nmap <silent> ,md :!mkdir -p %:p:h<CR>

" Tabstop 2 to that filetypes
autocmd FileType vim,css,ruby,eruby,tex,c,sh,java set smarttab tabstop=2 shiftwidth=2 softtabstop=2 autoindent expandtab
" Tabstop 4 to that
autocmd FileType python,js,javascript set smarttab tabstop=3 shiftwidth=3 softtabstop=3 autoindent expandtab

" :make  Compile/Execute some filetypes
" Just a shortcut
map <F9> :!clear<CR>:w<CR>:make<CR>

autocmd FileType c      set makeprg=gcc\ %\ -o\ %<\ -lm"
autocmd FileType sh     set makeprg=./%
autocmd FileType cpp    map <F9> :call CompileCPP()<CR>
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
map <F7> <esc>:set invspell<CR>
map <F6> zg
map <F8> z=

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
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

""""""""""""""" PLUGINS CONFIGURATION

" ColorSelect
" @shortcut <F5>
let g:FormatResultColorSelect='rgba'
imap <F5> <ESC>:ColorSelect<CR>

" Rails
map <C-p><C-r> :!rspec %<CR>
map <C-p>r :!rspec %<CR>
vmap <C-p>p :Rextract 

" Wiki
let potwiki_home=$HOME."/Dropbox/Public/.wiki/HomePage"
let potwiki_autowrite=1
" My default wiki head
function! WikiHead()
  if getfsize(expand('<afile>')) == -1
    normal gg
    call append(0, "# Potwiki - Kássio Borges")
    call append(1, "# Home: HomePage")
    call append(2, "# Wiki: " . expand("%:t"))
    call append(3, "#================================================")
    call append(4, "")
    normal G
  endif
endfunction

" Input head on wiki files
au BufNew,FileType potwiki call WikiHead()

" Latex configs
let g:tex_flavor='latex'
let g:Tex_BibtexFlavor='bibtex'
let g:Tex_BIBINPUTS="%\.bib"
let g:Tex_DefaultTargetFormat='pdf'
let g:Imap_UsePlaceHolders=0 " Turn off placeholders
" Turn off some boring shortcuts
let g:Tex_AdvancedMath=0 
let g:Tex_EnvironmentMaps=0
let g:Tex_EnvironmentMenus=0
let g:Tex_FontMaps=0
let g:Tex_FontMenus=0
let g:Tex_SectionMaps=0
let g:Tex_SectionMenus=0

" NERDTree
let g:NERDTreeWinPos="right"
let NERDTreeHighlightCursorline=1
nmap <silent> <Leader>p :execute "NERDTreeToggle \| :silent NERDTreeMirror"<CR>
nnoremap <silent> ,fl :call FindInNERDTree()<CR>

" Snipmate setup
try
  source ~/.vim/snippets/support_functions.vim
catch
  source ~/vimfiles/snippets/support_functions.vim
endtry
autocmd vimenter * call s:SetupSnippets()
function! s:SetupSnippets()
  "if we're in a rails env then read in the rails snippets
  if filereadable("./config/environment.rb")
    call ExtractSnips("~/.vim/snippets/ruby-rails", "ruby")
    call ExtractSnips("~/.vim/snippets/eruby-rails", "eruby")
  endif
  call ExtractSnips("~/.vim/snippets/html", "eruby")
  call ExtractSnips("~/.vim/snippets/html", "xhtml")
  call ExtractSnips("~/.vim/snippets/html", "php")
endfunction

" Tabular
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" CtrlP easy open files

let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 15
let g:ctrlp_switch_buffer = 2
let g:ctrlp_open_new_file = 't'
let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_follow_symlinks = 1

function! CtrlPPersonalOpenFunc()
  if getfsize(expand('%')) == -1
    let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'], 'AcceptSelection("t")': ['<c-t>'] }
  else
    let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<c-t>'], 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'] }
  endif
  silent! :CtrlP<CR>
endfunction
map <leader>t :call CtrlPPersonalOpenFunc()<CR>
map <leader>r :CtrlPBuffer<CR>

" Ruby Completion
let g:rubycomplete_rails = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1

" Textile
let g:TextileOS='linux'
let g:TextileBrowser='google-chrome'

" Syntastic
let g:syntastic_auto_loc_list=0 "don't pop up the Errors list automatically
let g:syntastic_check_on_open=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['ruby', 'eruby', 'c', 'cpp', 'cucumber', 'scss', 'css', 'javascript', 'json', 'sh', 'tex', 'html', 'xml', 'yaml'],
      \ 'passive_filetypes': ['puppet'] }

command! NewRubyHashSyntax %s/\v:(\w+)\ ?\=\>/\1:/g

" Color Highlight
let g:colorizer_auto_color = 1
let g:colorizer_x11_names = 1

" Ack
let g:ackprg="ack -H -i --column --follow"
map ,as :exec ":Ack "expand('<cword>')<CR>
