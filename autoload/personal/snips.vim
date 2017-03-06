function! personal#snips#filename_camelized(...)
  let name = expand("%:t:r")
  if len(name) == 0
    let name = a:0 ? a:1 : 'MyClass'
  end

  return s:camelcase(name)
endfunction

function! personal#snips#dirname_camelized()
  let name = split(getcwd(), '/')[-1]
  if len(name) == 0
    let name = 'MyNamespace'
  end

  return s:camelcase(name)
endfunction

function! s:camelcase(s)
  return substitute(a:s, '\v(^|_)(.)', '\U\2', 'g')
endfunction

function! personal#snips#start_comment()
  return substitute(<SID>comment_dict().begin, '\s*$', '', 'g')
endfunction

function! personal#snips#end_comment()
  return substitute(<SID>comment_dict().end, '\s*$', '', 'g')
endfunction

function! s:comment_dict()
  if !exists('b:comment_dict')
    let comments = split(&commentstring, '%s')
    let b:comment_dict = { 'begin': get(comments, 0, ''), 'end': get(comments, 1, '') }
    echo b:comment_dict
  end

  return b:comment_dict
endfunction
