function! user#snips#filename_camelized(...) abort
  let l:name = expand('%:t:r')
  if len(l:name) == 0
    let l:name = a:0 ? a:1 : 'MyClass'
  end

  return s:camelcase(l:name)
endfunction

function! user#snips#dirname_camelized() abort
  let l:name = split(getcwd(), '/')[-1]
  if len(l:name) == 0
    let l:name = 'MyNamespace'
  end

  return s:camelcase(l:name)
endfunction

function! s:camelcase(s) abort
  return substitute(a:s, '\v(^|_)(.)', '\U\2', 'g')
endfunction

function! user#snips#start_comment() abort
  return substitute(<SID>comment_dict().begin, '\s*$', '', 'g')
endfunction

function! user#snips#end_comment() abort
  return substitute(<SID>comment_dict().end, '\s*$', '', 'g')
endfunction

function! s:comment_dict() abort
  if !exists('b:comment_dict')
    let l:comments = split(&commentstring, '%s')
    let b:comment_dict = { 'begin': get(l:comments, 0, ''), 'end': get(l:comments, 1, '') }
    echo b:comment_dict
  end

  return b:comment_dict
endfunction
