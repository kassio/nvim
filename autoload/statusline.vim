function! statusline#update()
  for nr in range(1, winnr('$'))
    if bufname(winbufnr(nr)) =~ 'NERD_tree'
      call setwinvar(nr, '&statusline', g:NERDTreeStatusline)
    else
      if winnr() == nr
        call setwinvar(nr, '&statusline', statusline#line(1))
      else
        call setwinvar(nr, '&statusline', statusline#line(0))
      end
    end
  endfo
endfunction

function! statusline#line(active)
  if a:active
    return
          \   '%1* %{statusline#mode()} %*'
          \ . '%2* %n %*'
          \ . '%3* %m%f %*'
          \ . '%='
          \ . '%#StatusWarning#%{statusline#neomake("W")}%*'
          \ . '%#StatusError#%{statusline#neomake("E")}%*'
          \ . '%#NeotermTestRunning#%{neoterm#test#status("running")}%*'
          \ . '%#NeotermTestSuccess#%{neoterm#test#status("success")}%*'
          \ . '%#NeotermTestFailed#%{neoterm#test#status("failed")}%*'
          \ . '%3* %r%y %{&ff} %{&fenc!=""?&fenc:&enc} '
          \ . '%2* %c,%l/%L '
  else
    return
          \   '%4* %n %*'
          \ . '%4* %m%f %*'
          \ . '%='
          \ . '%4* %r%y %{&ff} %{&fenc!=""?&fenc:&enc} '
          \ . '%4* %c,%l/%L '
  end
endfunction

function! statusline#mode()
  return {
        \ '__' : '------',
        \ 'n'  : 'NORMAL',
        \ 'i'  : 'INSERT',
        \ 'R'  : 'REPLACE',
        \ 'v'  : 'VISUAL',
        \ 'V'  : 'V-LINE',
        \ 'c'  : 'COMMAND',
        \ '' : 'V-BLOCK',
        \ 's'  : 'SELECT',
        \ 'S'  : 'S-LINE',
        \ '' : 'S-BLOCK',
        \ 't'  : 'TERMINAL',
        \ }[mode()]
endfunction

function! statusline#neomake(scope)
  let loclist = filter(getloclist(0), "v:val.type == '".a:scope."'")

  if empty(loclist)
    return ""
  else
    let first_sign_line = loclist[0].lnum
    let sign_count = len(loclist)

    return printf("[%s: %s(%s)]", a:scope, first_sign_line, sign_count)
  end
endfunction
