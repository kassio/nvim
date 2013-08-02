" NERDTree
let g:NERDTreeWinPos="right"
let NERDTreeHighlightCursorline=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeStatusline="%{MyNERDTreeStatusLine()}"

function! MyNERDTreeStatusLine()
  let current_line = getline('.')
  return tlib#string#Strip(current_line)
endfunction

function! OpenNERDTreeMirror()
  try
    :NERDTreeToggle
    :NERDTreeMirror
  catch
    echo 'No NERDTree found, opening a new'
    :NERDTree
  endtry
endfunction

nmap <silent> <leader>p :call OpenNERDTreeMirror()<CR>
nnoremap <silent> <leader>fl :NERDTreeFind<CR>
command! E exec ":NERDTree ".expand('%:p')
