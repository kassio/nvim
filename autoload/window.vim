let s:ignored_filetypes = [
      \ 'help',
      \ 'fugitiveblame',
      \ 'coc-explorer',
      \ 'man'
      \ ]
let s:ignored_buftypes = [
      \ 'terminal'
      \ ]

function! window#focus(...) abort
  let l:properties = a:0 ? copy(a:000) : ['cursorline', 'norelativenumber', 'nonumber']

  if s:is_ignored()
    exec printf('setlocal %s', join(l:properties, ' '))
  else
    exec printf('setlocal %s', join(map(l:properties, {_, val -> val.'<'}), ' '))
  end
endfunction

function! s:is_ignored() abort
  return index(s:ignored_buftypes, &buftype) >= 0 ||
        \ index(s:ignored_filetypes, &filetype) >= 0
endfunction

function! window#unfocus(...) abort
  let l:properties = a:0 ? copy(a:000) : ['nocursorline', 'norelativenumber']

  exec printf('setlocal %s', join(l:properties, ' '))
endfunction
