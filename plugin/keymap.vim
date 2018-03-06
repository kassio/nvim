" faster esc
inoremap <esc> <c-c>
inoremap <C-U> <C-G>u<C-U>

tnoremap <esc><esc> <c-\><c-n>

" Use <c-l> to clear the highlighting of :set hlsearch.
nnoremap <c-l> :nohlsearch<cr><c-l>

" Delete current buffer
nnoremap <leader>bd :call buffer#kill()<cr>
" Delete all buffers
nnoremap <leader>da :call buffer#killall()<cr>
" Wipe all buffers
nnoremap <leader>wa :call buffer#wipeall()<cr>

nnoremap g# #
nnoremap g* *

nnoremap ' `
nnoremap ` '

vnoremap * :<c-u>call text#highlight_visual()<cr>//<cr>
vnoremap # :<c-u>call text#highlight_visual()<cr>??<cr>
vnoremap ! :<c-u>call text#highlight_visual()<cr>
nnoremap ! :call text#highlight(expand('<cword>'))<cr>
vnoremap g! :<c-u>call text#highlight('\<'.text#get_visual().'\>')<cr>
nnoremap g! :call text#highlight('\<'.expand('<cword>').'\>')<cr>
vnoremap <leader>! :<c-u>call text#highlight_sensitive_visual()<cr>
nnoremap <leader>! :call text#highlight_sensitive(expand('<cword>'))<cr>

" Tags
nnoremap g<c-]> :execute 'Tag ' . expand('<cword>')<cr>
vnoremap g<c-]> :<c-u>execute 'Tag ' . text#get_visual()<cr>
nnoremap <c-]> :execute 'tag ' . expand('<cword>')<cr>
nnoremap t<c-]> :execute 'tab tag ' . expand('<cword>')<cr>
nnoremap <c-w><c-]> :execute 'stag ' . expand('<cword>')<cr>
nnoremap v<c-]> :execute 'vert stag ' . expand('<cword>')<cr>

nnoremap K <nop>
nnoremap Q <nop>
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Indent all file
nnoremap <leader>ff :call preserve#preserve('silent normal gg=G')<cr>

" Map to show the highlight name under the cursor
nnoremap <f2> :echo color#current()<cr>

map <S-ScrollWheelUp> <C-U>
map <S-ScrollWheelDown> <C-D>

nmap <leader>sn :call sign#goto('next')<cr>
nmap <leader>sN :call sign#goto('previous')<cr>

" Signs navigation
" Lint signs
nmap <leader>ln :ALENextWrap<cr>
nmap <leader>lp :ALEPreviousWrap<cr>
" Signify
nmap <leader>gn <plug>(signify-next-hunk)
nmap <leader>gp <plug>(signify-prev-hunk)

" Command shortcuts/aliases
cnoremap <c-b> P bufdo %s///ge<left><left><left><left>
