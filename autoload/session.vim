let s:session_dir = expand('$HOME/.local/share/nvim/session')
let s:file_name = substitute(getcwd(), '\/', '_', 'g')
let s:file = printf('%s/%s', s:session_dir, s:file_name)

function! session#save() abort
  silent! exec printf('!mkdir -p %s', s:session_dir)
  if exists(':TcloseAll')
    TcloseAll!
  end

  silent! exec printf('silent! mksession! %s', s:file) | exec 'redraw!'
  call util#echohl('MoreMsg', 'Session Created')
endfunction

function! session#load() abort
  if filereadable(s:file)
    exec printf('silent! source %s', s:file) | exec 'redraw!'
    call util#echohl('MoreMsg', 'Session loaded')
  else
    call util#echohl('ErrorMsg', 'Session does not exists')
  end
endfunction

function! session#destroy() abort
  if filereadable(s:file)
    call util#echohl('WarningMsg', 'Session destroyed')
    silent! exec printf('!rm %s', s:file)
  else
    call util#echohl('ErrorMsg', 'Session does not exists')
  end
endfunction
