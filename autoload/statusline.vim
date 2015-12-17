function! statusline#update()
  for nr in range(1, winnr('$'))
    if bufname(winbufnr(nr)) =~ 'NERD_tree'
      call setwinvar(nr, '&statusline', g:NERDTreeStatusline)
    else
      call setwinvar(nr, '&statusline', statusline#line(winnr() == nr))
    end
  endfo
endfunction

function! statusline#line(active)
  if a:active
    return
          \   '%#SLModeNormal#%{statusline#mode("N")}%*'
          \ . '%#SLModeVisual#%{statusline#mode("V")}%*'
          \ . '%#SLModeInsert#%{statusline#mode("I")}%*'
          \ . '%#SLModeInsert#%{statusline#mode("R")}%*'
          \ . '%#SLModeTerminal#%{statusline#mode("T")}%*'
          \ . '%#SLSection1# %n %*'
          \ . '%(%#SLSection2#%<%{statusline#filename(!&modified)}%*%)'
          \ . '%(%#SLUnsavedFile#%{statusline#filename(&modified)}%*%)'
          \ . '%='
          \ . '%#StatusWarning#%{statusline#neomake("W")}%*'
          \ . '%#StatusError#%{statusline#neomake("E")}%*'
          \ . '%#StatusWarning#%{neoterm#test#status("running")}%*'
          \ . '%#StatusSuccess#%{neoterm#test#status("success")}%*'
          \ . '%#StatusError#%{neoterm#test#status("failed")}%*'
          \ . '%#SLSection2# %y %{&ff} %{&fenc!=""?&fenc:&enc} '
          \ . '%#SLSection1# %c,%l/%L '
  else
    return
          \   ' %n '
          \ . ' %m%<%f '
          \ . '%='
          \ . '%{statusline#neomake("W")}'
          \ . '%{statusline#neomake("E")}'
          \ . '%{neoterm#test#status("running")}'
          \ . '%{neoterm#test#status("success")}'
          \ . '%{neoterm#test#status("failed")}'
          \ . ' %r%y %{&ff} %{&fenc!=""?&fenc:&enc} '
          \ . ' %c,%l/%L '
  end
endfunction

function! statusline#filename(modified)
  if a:modified
    let fname = expand('%')
    return printf(' %s ', len(fname) ? fname : '[No Name]')
  else
    return ''
  end
endfunction

function! statusline#mode(base)
  if a:base == s:currentModeKey()
    return printf('  %s ', a:base)
  else
    return ''
  end
endfunction

function! s:currentModeKey()
  return get({
        \ 'n': 'N',
        \ 'v': 'V',
        \ 'V': 'V',
        \ '': 'V',
        \ 'i': 'I',
        \ 'R': 'R',
        \ 'Rv': 'R',
        \ 't': 'T',
        \ }, mode(), '-')
endfunction

function! statusline#neomake(scope)
  let loclist = filter(getloclist(0), "v:val.type == '".a:scope."'")

  if empty(loclist)
    return ""
  else
    let first_sign_line = loclist[0].lnum
    let sign_count = len(loclist)

    return printf("  %s: %s(%s) ", a:scope, first_sign_line, sign_count)
  end
endfunction
