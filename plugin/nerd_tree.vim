let g:NERDTreeWinPos="right"
let g:NERDTreeHighlightCursorline=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeStatusline="%{MyNERDTreeStatusLine()}"

" Shows only the current NERDTree line on statusline
function! MyNERDTreeStatusLine()
  let current_line = getline('.')
  return tlib#string#Strip(current_line)
endfunction

" If possible open a NERDTreeMirror
function! OpenNERDTreeMirror()
  try
    :NERDTreeToggle | NERDTreeMirror
  catch /^Vim\%((\a\+)\)\=:E121/
    :NERDTree
  catch
    redraw
  endtry
endfunction

nmap <silent> <leader>p :call OpenNERDTreeMirror()<CR>
nnoremap <silent> <leader>fl :NERDTreeFind<CR>
command! E exec ":NERDTree ".expand('%:p')
