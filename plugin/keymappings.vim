" Folding
nnoremap <silent> <F3> zM
nnoremap <silent> <F4> zR

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Delete current buffer
nnoremap <silent> <leader>bd :call buffer#kill()<CR>
" Delete all buffers
nnoremap <silent> <leader>da :silent bufdo call buffer#kill()<CR>
" Move current window to currend file path
nnoremap <silent> <leader>cd :lcd %:p:h<CR>:pwd<CR>

" Spell
nnoremap <silent> <F7> <esc>:set invspell<CR>
nnoremap <silent> <F6> zg
nnoremap <silent> <F8> z=

nnoremap <silent> g# #
nnoremap <silent> g* *

nnoremap <silent>g] :execute 'tselect ' . expand('<cword>')<CR>
nnoremap <silent><C-]> :execute 'tjump ' . expand('<cword>')<CR>
nnoremap <silent><C-w>g] :execute 'stselect ' . expand('<cword>')<CR>
nnoremap <silent><C-w><C-]> :execute 'stjump ' . expand('<cword>')<CR>

vnoremap <silent> * :<C-u>call text#highlight_visual()<CR>//<CR>
vnoremap <silent> # :<C-u>call text#highlight_visual()<CR>??<CR>
vnoremap <silent> ! :<c-u>call text#highlight_visual()<CR>
nnoremap <silent> ! :call text#highlight(expand('<cword>'))<CR>

nnoremap K <nop>
nnoremap Q <nop>

" Indent all file
nnoremap <silent> <leader>ff :call preserve#preserve('silent normal gg=G')<CR>

nnoremap 9gt :tablast<CR>
nnoremap 0gt :tabfirst<CR>

" Map to show the highlight name under the cursor
" map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
" \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
