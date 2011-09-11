" To pathogen works
filetype off
" Plugins by filetype
filetype plugin on
" Indentation by filetype
filetype indent on
" Enable syntax
syntax on

" Load submodules with pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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
" Mouse facility
set mouse=a
" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
" Make the command-line completion better
set wildmenu
" Showing list chars
" set list
" More useful tab completion on menu
set wildmode=list:longest
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
" Show number by default
set number
" Load external updates
set autoread
" Behavior when switching between buffers
set switchbuf=newtab
set tabpagemax=20
" Write external updates
set autowrite
" Indent by default
set autoindent
" Copy indent in/out
set copyindent
" Enable folds
set foldenable
" Show line with cursor
set cursorline
" Adding to autocomplete with current spell
set complete+=kspell
" Removing tags from autocomplete
set complete-=t,i
" Words to search functions
set iskeyword+=:,.
" Vertical split on right
set splitright
" Tab default with 4 size
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" Session options
set sessionoptions+=globals

if has("gui_running")
  " Disable gui menu
  set guioptions-=T
  " More spaced lines on gui
  set linespace=3
  " FontSize on gui
  set guifont=Droid\ Sans\ Mono\ 12
  " Set window size on gui
  autocmd vimenter * set lines=28 
  autocmd vimenter * set columns=134

  " Tab navigation
  map <C-Tab> <esc>:tabnext<CR>
  map <C-S-Tab> <esc>:tabprevious<CR>
  map <A-1> <esc>:tabfirst<CR>
  map <A-2> <esc>2gt<CR>
  map <A-3> <esc>3gt<CR>
  map <A-4> <esc>4gt<CR>
  map <A-5> <esc>5gt<CR>
  map <A-6> <esc>6gt<CR>
  map <A-7> <esc>7gt<CR>
  map <A-8> <esc>8gt<CR>
  map <A-9> <esc>:tablast<CR>
endif

" My statusline
" Verify if file is ruby to show ruby version on statusline
autocmd Filetype ruby,rb,rails,eruby let g:ft_ruby=1

set statusline=%m                                          " File modify signal
set statusline+=%f                                         " Filename
set statusline+=%{exists(GitBranch())?[GitBranch()]:''}    " Git
set statusline+=%{exists('g:ft_ruby')?rvm#statusline():''} " RVM
set statusline+=%=                                         " Separator
set statusline+=[ASCII=%b]                                 " ASCII value of char under cursor
set statusline+=[HEX=%B]                                   " ASCII in HEX value of char under cursor
set statusline+=[%c,%l/%L]                                 " Cursor [column,line/total] lines
set statusline+=\ %P                                       " Percent through file
set laststatus=2

" Appearance
set t_Co=256
set background=dark
let colorscheme_name='xoria256'
exe 'colorscheme '.colorscheme_name

" Search facilities
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" Full copy/cut/past simple
inoremap <C-v> <ESC>"+gpa
vnoremap <C-c> "+y
vnoremap <C-x> "+x

" Make Y consistent with C and D
nnoremap Y y$

" Full file indent
noremap ,ff <ESC>:normal mzgg=G`zzz<CR>

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
" Toogle background color
nmap <silent> ,nbg :hi Normal ctermbg=none<CR>
" Retrive background color
nmap <silent> ,bg :exe 'colorscheme '.colorscheme_name<CR>

" Tabstop 2 to that filetypes
autocmd FileType vim,css,ruby,eruby,tex,c,sh,java set smarttab tabstop=2 shiftwidth=2 softtabstop=2 autoindent expandtab
" Tabstop 4 to that
autocmd FileType python,js,javascript set smarttab tabstop=3 shiftwidth=3 softtabstop=3 autoindent expandtab

" :make  Compile/Execute some filetypes
autocmd FileType c      set makeprg=gcc\ %\ -o\ %<\ -lm"
autocmd FileType cpp    set makeprg=g++\ %\ -o\ %<\ -lm"
autocmd FileType ruby   set makeprg=ruby\ %
autocmd FileType python set makeprg=python\ %
" Just a shortcut
map <F9> :w<CR>:make<CR>

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

""""""""""""""" PLUGINS CONFIGURATION

" ColorSelect
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
let g:Tex_ViewRuleComplete_pdf="evince ".expand('%:p:r').".pdf 2> /tmp/vim_latex_errors &"
let g:Imap_UsePlaceHolders=0 " Turn off placeholders
" Turn off some boring shortcuts
let g:Tex_AdvancedMath=0 
let g:Tex_EnvironmentMaps=0
let g:Tex_EnvironmentMenus=0
let g:Tex_FontMaps=0
let g:Tex_FontMenus=0
let g:Tex_SectionMaps=0
let g:Tex_SectionMenus=0

" Surround
" Autoclose in visual mode
vmap [ s[ 
vmap ( s(
vmap { s{
vmap ] s]
vmap ) s)
vmap } s}
vmap " s"
vmap ' s'

" NERDTree
let g:NERDTreeWinPos="right"
let g:NERDTreeNewTabWithTree=0
silent! nmap <silent> <Leader>p :NERDTreeMirrorToggle<CR>
nnoremap <silent> <C-l>l :call FindInNERDTree()<CR>

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

" FuzzyFinder
function! FuzzyFinderFunc()
  silent! :FufRenewCache<CR>
  if getfsize(expand('%')) == -1
    let g:fuf_keyOpen='<CR>'
    let g:fuf_keyOpenTabpage='<C-l>'
  else
    let g:fuf_keyOpen='<C-l>'
    let g:fuf_keyOpenTabpage='<CR>'
  endif
  silent! :FufFile ./**/
  silent! :tabmove 9999
endfunction
map <Leader>t :call FuzzyFinderFunc()<CR>

" SuperTab
let g:SuperTabMappingForward='<s-tab>'
let g:SuperTabMappingBackward='<tab>'

" Textile
let g:TextileOS='linux'
let g:TextileBrowser='google-chrome'
