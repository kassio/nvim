" Make Y behave like C and D
nnoremap Y y$

" Make cw behave like dw and yw
onoremap w :execute 'normal! '.v:count1.'w'<CR>

" Keep the cursor centered
nnoremap n, nzzzv
nnoremap N, Nzzzv
nnoremap J, mzJ`z

" Undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap } }<c-g>u
inoremap { {<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap _ _<c-g>u
inoremap - -<c-g>u
inoremap # #<c-g>u

" Jump list mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Moving text
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv
inoremap <c-j> <esc>:m .+1<CR>==
inoremap <c-k> <esc>:m .-2<CR>==
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
