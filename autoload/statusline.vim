function! statusline#update()
  for nr in range(1, winnr('$'))
    if bufname(winbufnr(nr)) =~ 'NERD_tree'
      call setwinvar(nr, '&statusline', g:NERDTreeStatusline)
    elseif bufname(winbufnr(nr)) =~ ';#neoterm'
      call setwinvar(nr, '&statusline', statusline#neoterm(winnr() == nr))
    else
      call setwinvar(nr, '&statusline', statusline#line(winnr() == nr))
    end
  endfor
endfunction

function! statusline#neoterm(active)
  let default =
        \   '%#SLModeTerminal#%{statusline#mode("T")}%*'
        \ . ' %n '
        \ . '%<%{statusline#termname()}%*'
        \ . '%= '

  if a:active
    return
          \  '%#SLModeNormal#%{statusline#mode("N")}%*'
          \ . default
          \ . '%#StatusWarning#%{statusline#neoterm_count()}%*'
  else
    return default
  end
endfunction

function! statusline#termname()
  return b:term_title
endfunction

function! statusline#line(active)
  if a:active
    return
          \   '%#SLModeNormal#%{statusline#mode("N")}%*'
          \ . '%#SLModeVisual#%{statusline#mode("V")}%*'
          \ . '%#SLModeInsert#%{statusline#mode("I")}%*'
          \ . '%#SLModeInsert#%{statusline#mode("R")}%*'
          \ . '%<%{statusline#filename(!&modified)}%*'
          \ . '%(%#SLUnsavedFile#%<%{statusline#filename(&modified)}%*%)'
          \ . '%='
          \ . '%#StatusWarning#%{statusline#neomake("W")}%*'
          \ . '%#StatusError#%{statusline#neomake("E")}%*'
          \ . ' %c,%l/%L '
          \ . '%#StatusWarning#%{statusline#neoterm_count()}%*'
          \ . '%#SLModeNormal#'
          \ . ' %{&ft} %{&ff} %{&fenc!=""?&fenc:&enc} '
  else
    return
          \   ' %n '
          \ . ' %m%<%f '
          \ . '%='
          \ . '%{statusline#neoterm_count()}'
          \ . ' %{&ft} %{&ff} %{&fenc!=""?&fenc:&enc} '
  end
endfunction

function! statusline#neoterm_count()
  let neoterm_count = len(g:neoterm.instances)
  if neoterm_count > 0
    return printf(" NT(%d) ", neoterm_count)
  else
    return ""
  end
endfunction

function! statusline#filename(modified)
  if a:modified
    let fname = expand('%')
    if len(fname)
      return printf("  %s %s ", bufnr('%'), fname)
    else
      return "  [No Name] "
    end
  else
    return ""
  end
endfunction

function! statusline#mode(base)
  if a:base == s:currentModeKey()
    return printf('  %s ', a:base)
  else
    return ""
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
    return ""
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
    return ""
  end
endfunction
