function! s:escaped_file_path()
  return substitute(getcwd(), '\/', '_', 'g')
endfunction

function! session#save() abort
  silent! exec printf('!mkdir -p %s', g:session_dir)

  silent! exec printf('silent! mksession! %s', session#file()) | exec 'redraw!'
  call util#echohl('MoreMsg', 'Session Created')
endfunction

function! session#load() abort
  if filereadable(session#file())
    exec printf('silent! source %s', session#file()) | exec 'redraw!'
    call util#echohl('MoreMsg', 'Session loaded')
  else
    call util#echohl('ErrorMsg', 'Session does not exists')
  end
endfunction

function! session#destroy() abort
  if filereadable(session#file())
    call util#echohl('WarningMsg', 'Session destroyed')
    silent! exec printf('!rm %s', session#file())
  else
    call util#echohl('ErrorMsg', 'Session does not exists')
  end
endfunction

function! session#destroy_all()
  for session_file in glob(session#file({'prefix': '*'}), v:null, v:true)
    call system(printf('rm %s', session_file))
  endfor
endfunction

function! session#file(...)
  let l:options = get(a:, 1, {})
  let l:default_prefix = get(g:, 'session_file_prefix', '')
  let l:prefix = get(l:options, 'prefix', l:default_prefix)

  return printf(
        \ '%s/%s%s',
        \ g:session_dir,
        \ l:prefix,
        \ s:escaped_file_path())
endfunction
