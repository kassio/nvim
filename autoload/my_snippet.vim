function! my_snippet#ruby_class_name_from_filename(...)
  let name = expand("%:t:r")
  if len(name) == 0
    if a:0 == 0
      let name = 'my_class'
    else
      let name = a:1
    endif
  endif
  return s:camelcase(name)
endfunction

function! s:camelcase(s)
  "upcase the first letter
  let to_return = substitute(a:s, '^\(.\)', '\=toupper(submatch(1))', '')
  "turn all '_x' into 'X'
  return substitute(to_return, '_\(.\)', '\=toupper(submatch(1))', 'g')
endfunction

function! my_snippet#modeline()
  return self.start_comment() . " vim:${1:ft=rb:tw=80:hls:}:" . self.end_comment()
endfunction

function! my_snippet#start_comment()
  return <SID>set_comment_dict().begin
endfunction

function! my_snippet#end_comment()
  return <SID>set_comment_dict().end
endfunction

function! s:set_comment_dict()
  if !exists('b:comment_dict')
    let comments = split(&commentstring, '%s')
    let b:comment_dict = { 'begin': get(comments, 0, ''), 'end': get(comments, 1, '') }
    echo b:comment_dict
  endif

  return b:comment_dict
endfunction
