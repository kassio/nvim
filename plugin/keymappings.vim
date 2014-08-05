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

nnoremap <silent> # g#
nnoremap <silent> g# #
nnoremap <silent> * g*
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
nnoremap <up> <nop>
nnoremap <right> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>

" Indent all file
nnoremap <silent> <leader>ff :call preserve#preserve('normal gg=G')<CR>
