function! statusline#update()
  for nr in range(1, winnr('$'))
    if bufname(winbufnr(nr)) =~ 'NERD_tree'
      call setwinvar(nr, '&statusline', g:NERDTreeStatusline)
    elseif getwinvar(nr, '&filetype') =~# 'help'
      call setwinvar(nr, '&statusline', statusline#help#(winnr() == nr))
    elseif bufname(winbufnr(nr)) =~ ';#neoterm'
      call setwinvar(nr, '&statusline', statusline#neoterm#(winnr() == nr))
    else
      call setwinvar(nr, '&statusline', statusline#line(winnr() == nr))
    end
  endfor
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
          \ . '%#StatusWarning#%{statusline#linter("W")}%*'
          \ . '%#StatusError#%{statusline#linter("E")}%*'
          \ . ' %c,%l/%L '
          \ . '%#SLModeNormal#'
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
    let fname = fname =~# '^/' ? fnamemodify(fname, ':~') : fnamemodify(fname, ':.')
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

function! statusline#linter(scope)
  let l:loclist = filter(getloclist(0), { _, item ->
        \    type(item) == v:t_dict &&
        \     item.type == a:scope &&
        \     item.bufnr == winbufnr(winnr())
        \  })

  if empty(l:loclist)
    return ''
  else
    let l:sign = a:scope ==# 'W' ? g:sign_warning : g:sign_error
    let l:sign_count = len(l:loclist)
    let l:count = l:sign_count > 99 ? '++' : l:sign_count

    return printf('  %s %s ', l:count, l:sign)
  end
endfunction
