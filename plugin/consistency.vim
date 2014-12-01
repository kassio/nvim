" Make Y behave like C and D
nnoremap Y y$

" Make cw behave like dw and yw
onoremap w :execute 'normal! '.v:count1.'w'<CR>
