let s:file_name = '._vim/session'

function! session#save() abort
  silent! !mkdir -p ._vim
  if has('nvim') && exists(':TcloseAll')
    TcloseAll!
  end

  silent! exec printf('silent! mksession! %s', s:file_name) | exec 'redraw!'
  call util#echohl('MoreMsg', 'Session Created')
endfunction

function! session#load() abort
  if filereadable(s:file_name)
    exec printf('silent! source %s', s:file_name) | exec 'redraw!'
    call util#echohl('MoreMsg', 'Session loaded')
  else
    call util#echohl('ErrorMsg', 'Session does not exists')
  end
endfunction

function! session#destroy() abort
  if filereadable(s:file_name)
    call util#echohl('WarningMsg', 'Session destroyed')
    silent! exec printf('!rm %s', s:file_name)
  else
    call util#echohl('ErrorMsg', 'Session does not exists')
  end
endfunction
