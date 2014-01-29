" Folding
noremap <F3> zM
noremap <F4> zR

" Make Y consistent with C and D
nnoremap Y y$

" Make <C-l> clear the highlight
nnoremap <silent> <C-l> :nohls<CR>

" Show all buffers
nnoremap <silent> <leader>ls :ls!<CR>
" Delete current buffer
nnoremap <silent> <leader>bd :bd!<CR>
" Delete all buffers
nnoremap <silent> <leader>da :exec "1," . bufnr('$') . "bd"<CR>
" Move current window to currend file path
nnoremap <leader>cd :silent! lcd %:p:h<CR>:pwd<CR>

" Spell
noremap <F7> <esc>:set invspell<CR>
noremap <F6> zg
noremap <F8> z=

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
noremap <leader>ff :call Preserve('normal gg=G')<CR>
