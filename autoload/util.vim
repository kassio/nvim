function! util#echohl(hi, msg) abort
  exec printf("echohl %s | echo '%s' | echohl None", a:hi, a:msg)
endfunction

function! util#flatten(list, ...)
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
