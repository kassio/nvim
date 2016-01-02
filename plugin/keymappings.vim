" faster esc
inoremap <esc> <c-c>
inoremap <C-U> <C-G>u<C-U>

" easiest way to escape terminal mode
tnoremap <esc><esc> <c-\><c-n>

nnoremap <leader>J mzJ`z

" Folding
nnoremap <silent> <f3> zM
nnoremap <silent> <f4> zR

" Use <c-l> to clear the highlighting of :set hlsearch.
nnoremap <silent> <c-l> :nohlsearch<cr><c-l>

" Delete current buffer
nnoremap <silent> <leader>bd :call buffer#kill()<cr>
" Delete all buffers
nnoremap <silent> <leader>da :silent bufdo! call buffer#kill()<cr>
" Move current window to currend file path
nnoremap <silent> <leader>cd :lcd %:p:h<cr>:pwd<cr>

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
vnoremap <silent> <leader>! :<c-u>call text#highlight_sensitive_visual()<cr>
nnoremap <silent> <leader>! :call text#highlight_sensitive(expand('<cword>'))<cr>

nnoremap K <nop>
nnoremap Q <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Indent all file
nnoremap <silent> <leader>ff :call preserve#preserve('silent normal gg=G')<cr>

" Map to show the highlight name under the cursor
map <f2> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>
