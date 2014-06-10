function! helper#filename_camelized()
  let name = expand("%:t:r")
  if len(name) == 0
    if a:0 == 0
      let name = 'MyClass'
    endif
  endif

  return s:camelcase(name)
endfunction

function! s:camelcase(s)
  return substitute(a:s, '\v(^|_)(.)', '\U\2', 'g')
endfunction

function! helper#start_comment()
  return substitute(<SID>comment_dict().begin, '\s*$', '', 'g')
endfunction

function! helper#end_comment()
  return substitute(<SID>comment_dict().end, '\s*$', '', 'g')
endfunction

function! s:comment_dict()
  if !exists('b:comment_dict')
    let comments = split(&commentstring, '%s')
    let b:comment_dict = { 'begin': get(comments, 0, ''), 'end': get(comments, 1, '') }
    echo b:comment_dict
  endif

  return b:comment_dict
endfunction
