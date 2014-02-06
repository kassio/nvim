" Folding
nnoremap <silent> <F3> zM
nnoremap <silent> <F4> zR

" Make Y consistent with C and D
nnoremap Y y$

" Make <C-l> clear the highlight
nnoremap <silent> <C-l> :nohls<CR>

" Show all buffers
nnoremap <silent> <leader>ls :ls!<CR>
" Delete current buffer
nnoremap <silent> <leader>bd :bw!<CR>
" Delete all buffers
nnoremap <silent> <leader>da :exec "1," . bufnr('$') . "bw"<CR>
" Move current window to currend file path
nnoremap <silent> <leader>cd :lcd %:p:h<CR>:pwd<CR>

" Spell
noremap <silent> <F7> <esc>:set invspell<CR>
noremap <silent> <F6> zg
noremap <silent> <F8> z=

nnoremap <silent> # g#
nnoremap <silent> g# #
nnoremap <silent> * g*
nnoremap <silent> g* *

nnoremap <silent> !
      \ :silent exec "let g:star_view=winsaveview()" \|
      \ silent exec "normal *" \|
      \ silent exec "call winrestview(g:star_view)"<CR>

nmap K <nop>
nmap Q <nop>
nmap <up> <nop>
nmap <right> <nop>
nmap <down> <nop>
nmap <left> <nop>

" Indent all file
noremap <silent> <leader>ff :call Preserve('normal gg=G')<CR>
