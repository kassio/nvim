function! match_counter#stl()
  if v:hlsearch
    if exists('b:match_counter') && b:last_match == @/
      return s:formated(b:match_counter)
    else
      call preserve#preserve("%s//&/gne")
      let l:list = matchlist(v:statusmsg, '\v(\d+).*on\s(\d+)')
      let v:statusmsg = ''

      if len(l:list)
        let b:match_counter = l:list[1]
        let b:last_match = @/
        return s:formated(b:match_counter)
      else
        return ''
      endif
    endif
  endif

  return ''
endfunction

function! s:formated(value)
  return "[matches: ".a:value."]"
endfunction
