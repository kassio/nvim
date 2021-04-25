let s:ignored_filetypes = [
      \ 'help',
      \ 'fugitiveblame',
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

function! window#responsive_mod(mod = '', default = '')
  let l:mod = s:validate_mod(a:mod)
  let l:default = s:validate_mod(a:default)
  let l:chosen = l:mod !=# '' ? l:mod : l:default

  if winwidth('.')/2 > 110
    return printf('%s vertical', l:chosen)
  else
    return l:chosen
  end
endfunction

function! s:validate_mod(mod)
  return index(['aboveleft', 'belowright','botright', 'browse', 'confirm',
        \ 'hide', 'keepalt','keepjumps', 'keepmarks', 'keeppatterns',
        \ 'leftabove', 'lockmarks', 'noswapfile', 'rightbelow', 'silent',
        \ 'tab', 'topleft', 'verbose', 'vertical'], a:mod) >= 0 ? a:mod : ''
endfunction
