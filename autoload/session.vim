let s:file_name = '._vim/session'

function! session#save() abort
  silent! !mkdir -p ._vim
  if has('nvim') && exists(':TcloseAll')
    TcloseAll!
  end

  silent! exec printf('silent! mksession! %s', s:file_name) | exec 'redraw!'
  call s:echohl('MoreMsg', 'Session Created')
endfunction

function! session#load() abort
  if filereadable(s:file_name)
    exec printf('silent! source %s', s:file_name) | exec 'redraw!'
    call s:echohl('MoreMsg', 'Session loaded')
  else
    call s:echohl('ErrorMsg', 'Session does not exists')
  end
endfunction

function! session#destroy() abort
  if filereadable(s:file_name)
    call s:echohl('WarningMsg', 'Session destroyed')
    silent! exec printf('!rm %s', s:file_name)
  else
    call s:echohl('ErrorMsg', 'Session does not exists')
  end
endfunction

function! s:echohl(hi, msg) abort
  exec printf("echohl %s | echo '%s' | echohl None", a:hi, a:msg)
endfunction
