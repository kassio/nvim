setlocal scrolloff=0
nnoremap <buffer> <c-t> :exec "tab cc".line(".")<cr>
nnoremap <buffer> <c-x> :exec "cc".line(".")<cr>
nnoremap <buffer> <c-v> :exec "vert cc ".line(".")<cr>
