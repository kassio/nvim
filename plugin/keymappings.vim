" faster esc
inoremap <esc> <c-c>

" Folding
nnoremap <silent> <f3> zM
nnoremap <silent> <f4> zR

" Use <c-l> to clear the highlighting of :set hlsearch.
if maparg('<c-l>', 'n') ==# ''
  nnoremap <silent> <c-l> :nohlsearch<cr><c-l>
endif

" Delete current buffer
nnoremap <silent> <leader>bd :call buffer#kill()<cr>
" Delete all buffers
nnoremap <silent> <leader>da :silent bufdo call buffer#kill()<cr>
" Move current window to currend file path
nnoremap <silent> <leader>cd :lcd %:p:h<cr>:pwd<cr>

" Spell
nnoremap <silent> <f7> <esc>:set invspell<cr>
nnoremap <silent> <f6> zg
nnoremap <silent> <f8> z=

nnoremap <silent> g# #
nnoremap <silent> g* *

nnoremap <silent>g] :execute 'tselect ' . expand('<cword>')<cr>
nnoremap <silent><c-]> :execute 'tjump ' . expand('<cword>')<cr>
nnoremap <silent><c-w>g] :execute 'stselect ' . expand('<cword>')<cr>
nnoremap <silent><c-w><c-]> :execute 'stjump ' . expand('<cword>')<cr>

vnoremap <silent> * :<c-u>call text#highlight_visual()<cr>//<cr>
vnoremap <silent> # :<c-u>call text#highlight_visual()<cr>??<cr>
vnoremap <silent> ! :<c-u>call text#highlight_visual()<cr>
nnoremap <silent> ! :call text#highlight(expand('<cword>'))<cr>

nnoremap K <nop>
nnoremap Q <nop>

" Indent all file
nnoremap <silent> <leader>ff :call preserve#preserve('silent normal gg=G')<cr>

" Map to show the highlight name under the cursor
map <f2> :echo "hi<" . synidattr(synid(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
