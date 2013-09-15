" Folding
noremap <F3> zM
noremap <F4> zR

" Make Y consistent with C and D
nnoremap Y y$

" Make <C-l> clear the highlight
nnoremap <C-l> :nohls<CR>:set hls?<CR>

" Show all buffers
nnoremap <silent> ,ls :ls!<CR>
" Delete current buffer
nnoremap <silent> ,bd :bd!<CR>
" Delete all buffers
nnoremap <silent> ,da :exec "1," . bufnr('$') . "bd"<CR>
" Toogle list characters
nnoremap <silent> ,ll :set invlist<CR>:set list?<CR>

" Sorting selected text
vnoremap ,ss :sort<CR>

" Spell
noremap <F7> <esc>:set invspell<CR>
noremap <F6> zg
noremap <F8> z=

nmap K <nop>
nmap Q <nop>
nmap <up> <nop>
nmap <right> <nop>
nmap <down> <nop>
nmap <left> <nop>
