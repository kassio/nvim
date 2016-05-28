function! statusline#update()
  for nr in range(1, winnr('$'))
    if bufname(winbufnr(nr)) =~ 'NERD_tree'
      call setwinvar(nr, '&statusline', g:NERDTreeStatusline)
    elseif bufname(winbufnr(nr)) =~ 'neoterm'
      call setwinvar(nr, '&statusline', statusline#neoterm())
    else
      call setwinvar(nr, '&statusline', statusline#line(winnr() == nr))
    end
  endfo
endfunction

function! statusline#neoterm()
  return
        \   '%{statusline#mode("N")}%*'
        \ . '%#SLModeTerminal#%{statusline#mode("T")}%*'
        \ . ' %n '
        \ . '%<%{statusline#termname()}%*'
        \ . '%='
        \ . '%#StatusWarning#%{statusline#neoterm_test("running")}%*'
        \ . '%#StatusSuccess#%{statusline#neoterm_test("success")}%*'
        \ . '%#StatusError#%{statusline#neoterm_test("failed")}%*'
endfunction

function! statusline#termname()
  let tname = expand('%')
  let tname_parts = split(tname, ':')

  return join(split(tname_parts[2], ';'), '')
endfunction

function! statusline#line(active)
  if a:active
    return
          \   '%{statusline#mode("N")}%*'
          \ . '%#SLModeVisual#%{statusline#mode("V")}%*'
          \ . '%#SLModeInsert#%{statusline#mode("I")}%*'
          \ . '%#SLModeInsert#%{statusline#mode("R")}%*'
          \ . ' %n '
          \ . '%<%{statusline#filename(!&modified)}%*'
          \ . '%(%#SLUnsavedFile#%<%{statusline#filename(&modified)}%*%)'
          \ . '%='
          \ . '%#StatusWarning#%{statusline#neomake("W")}%*'
          \ . '%#StatusError#%{statusline#neomake("E")}%*'
          \ . '%#StatusWarning#%{statusline#neoterm_test("running")}%*'
          \ . '%#StatusSuccess#%{statusline#neoterm_test("success")}%*'
          \ . '%#StatusError#%{statusline#neoterm_test("failed")}%*'
          \ . ' %{&ft} %{&ff} %{&fenc!=""?&fenc:&enc} '
  else
    return
          \   ' %n '
          \ . ' %m%<%f '
          \ . '%='
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

function! statusline#neoterm_test(scope)
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
