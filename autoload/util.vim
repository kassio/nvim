function! util#echohl(hi, msg) abort
  exec printf("echohl %s | echo '%s' | echohl None", a:hi, a:msg)
endfunction

function! util#flatten(list, ...) abort
  let l:result = a:0 > 0 ? a:1 : []
  for l:item in a:list
    if type(l:item) == type([])
      call util#flatten(l:item, l:result)
    else
      call add(l:result, l:item)
    end
  endfor

  return l:result
endfunction

function! util#comment_dict() abort
  if !exists('b:comment_dict')
    let l:comments = split(&commentstring, '%s')
    let b:comment_dict = {
          \ 'begin': trim(get(l:comments, 0, '')),
          \ 'end': trim(get(l:comments, 1, ''))
          \ }
  end

  return b:comment_dict
endfunction

function! util#copy_filename(external_clipboard, ...)
  let flag = get(a:, 1, '')
  let flag = s:valid_flag(flag) ? flag : ''
  let filename = expand('%'.flag)
  let F = { target ->  printf('"%s" copied to %s', filename, target) }

  if a:external_clipboard != 0
    let @*= filename
    echo F('system clipboard')
  else
    let @"= filename
    echo F(printf("'%s' reg", '"'))
  end
endfunction

function! s:valid_flag(flag)
  let result = v:true

  for flag in split(a:flag, ':')
    let result = index(['p', 'h', 't', 'r', 'e'], flag) >= 0
  endfor

  return result
endfunction

function! util#write_with_path()
  call util#mkdir_path()
  write!
endfunction

function! util#mkdir_path()
  call mkdir(expand('%:h'), 'p')
endfunction
