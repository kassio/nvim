" named opts
" - prefix: default empty string
function! session#save(...) abort
  let opts = extend(get(a:, 1, {}), { 'prefix': '' }, 'keep')
  silent! exec printf('!mkdir -p %s', g:session_dir)

  silent! exec printf('silent! mksession! %s', session#file(opts)) | exec 'redraw!'
  call util#echohl('MoreMsg', 'Session Created')
endfunction

function! session#load() abort
  function! Loader(file)
    if filereadable(a:file)
      exec printf('silent! source %s', a:file) | exec 'redraw!'
      call util#echohl('MoreMsg', 'Session loaded')
    else
      call util#echohl('ErrorMsg', 'Session does not exists')
    end
  endfunction

  return s:session_do(function('Loader'))
endfunction

function! session#destroy() abort
  function! Destroyer(file)
    if filereadable(a:file)
      silent! exec printf('!rm %s', a:file)
      call util#echohl('WarningMsg', 'Session destroyed')
    else
      call util#echohl('ErrorMsg', 'Session does not exists')
    end
  endfunction

  return s:session_do(function('Destroyer'))
endfunction

function! session#destroy_all() abort
  for session_file in session#list()
    call system(printf('rm %s', session_file))
    call util#echohl('WarningMsg', printf('Session "%s" destroyed', session_file))
  endfor
endfunction

function! session#list() abort
  let result = glob(session#file({'prefix': '*'}), v:false, v:true)

  return type(result) == v:t_list ? result : []
endfunction

" named opts
" - prefix: default empty string
function! session#file(...) abort
  let opts = extend(get(a:, 1, {}), { 'prefix': '' }, 'keep')

  return printf(
        \ '%s/%s%s',
        \ g:session_dir,
        \ opts.prefix,
        \ s:escaped_file_path())
endfunction

function! s:session_do(Fn) abort
  let list = session#list()

  if len(list) == 0
    return
  elseif len(list) == 1
    return a:Fn(list[0])
  else
    let index = s:session_selector(list)

    " confirm returns 0 for <esc>
    " and the chose choice indexed on 1
    if index > 0
      return a:Fn(list[index-1])
    else
      call util#echohl('ErrorMsg', "\nInvalid choice")
    end
  end
endfunction

function! s:session_selector(list) abort
  echo 'Available Sessions'
  for session in map(copy(a:list), function('s:choicify'))
    echo session
  endfor

  return str2nr(input('Choose a number: '))
endfunction

function! s:choicify(index, item) abort
  let result = split(a:item, '/')
  let result = result[-1:][0]
  let result = printf('%s - %s', a:index + 1, result)

  return result
endfunction

function! s:escaped_file_path() abort
  return substitute(getcwd(), '\/', '_', 'g')
endfunction
