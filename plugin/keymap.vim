" faster esc
inoremap <esc> <c-c>
inoremap <C-U> <C-G>u<C-U>

if has('nvim')
  " easiest way to escape terminal mode
  tnoremap <esc><esc> <c-\><c-n>
end

" Use <c-l> to clear the highlighting of :set hlsearch.
nnoremap <silent> <c-l> :nohlsearch<cr><c-l>

" Delete current buffer
nnoremap <silent> <leader>bd :call buffer#kill()<cr>
" Delete all buffers
nnoremap <silent> <leader>da :silent call buffer#killall()<cr>

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
vnoremap <silent> g! :<c-u>call text#highlight('\<'.text#get_visual().'\>')<cr>
nnoremap <silent> g! :call text#highlight('\<'.expand('<cword>').'\>')<cr>
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
nnoremap <f2> :echo color#current()<cr>

" Grep mappings
vnoremap <silent> <leader>as :<c-u>call grep#search(text#get_visual(), 1)<cr>
nnoremap <silent> <leader>as :call grep#search(expand("<cword>"), 1)<cr>
