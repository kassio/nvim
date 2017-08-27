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
  return substitute(util#comment_dict().begin, '\s*$', '', 'g')
endfunction

function! user#snips#end_comment() abort
  return substitute(util#comment_dict().end, '\s*$', '', 'g')
endfunction
