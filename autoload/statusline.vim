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
          \ . '%(%#SLUnsavedFile#%<%{statusline#filename(&modified)}%*%)'
          \ . '%='
          \ . '%#StatusWarning#%{statusline#neomake("W")}%*'
          \ . '%#StatusError#%{statusline#neomake("E")}%*'
          \ . '%#StatusWarning#%{statusline#neoterm("running")}%*'
          \ . '%#StatusSuccess#%{statusline#neoterm("success")}%*'
          \ . '%#StatusError#%{statusline#neoterm("failed")}%*'
          \ . '%#SLSection2# %c,%l/%L'
          \ . '%#SLSection2# %{&ft} %{&ff} %{&fenc!=""?&fenc:&enc} '
  else
    return
          \   ' %n '
          \ . ' %m%<%f '
          \ . '%='
          \ . ' %c,%l/%L '
          \ . ' %{&ft} %{&ff} %{&fenc!=""?&fenc:&enc} '
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

function! statusline#neoterm(scope)
  if has('nvim')
    return neoterm#test#status(a:scope)
  else
    return ''
  end
endfunction

function! statusline#neomake(scope)
  if has('nvim')
    let loclist = filter(getloclist(0), "v:val.type == '".a:scope."'")

    if empty(loclist)
      return ""
    else
      let first_sign_line = loclist[0].lnum
      let sign_count = len(loclist)

      return printf("  %s: %s(%s) ", a:scope, first_sign_line, sign_count)
    end
  else
    return ''
  end
endfunction
