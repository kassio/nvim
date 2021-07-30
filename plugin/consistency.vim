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
