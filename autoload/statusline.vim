function! statusline#update() abort
  for l:nr in range(1, winnr('$'))
    let l:filetype = getwinvar(l:nr, '&filetype')

    if l:filetype =~# 'help'
      call setwinvar(l:nr, '&statusline', statusline#help#(winnr() == l:nr))
    elseif l:filetype =~# 'neoterm'
      call setwinvar(l:nr, '&statusline', statusline#neoterm#(winnr() == l:nr))
    else
      call setwinvar(l:nr, '&statusline', statusline#default(winnr() == l:nr))
    end
  endfor
endfunction

function! statusline#default(active) abort
  if a:active
    return
          \   '%#SLModeNormal#%{statusline#mode("N")}%*'
          \ . '%#SLModeCommand#%{statusline#mode("C")}%*'
          \ . '%#SLModeVisual#%{statusline#mode("V")}%*'
          \ . '%#SLModeInsert#%{statusline#mode("I")}%*'
          \ . '%#SLModeInsert#%{statusline#mode("R")}%*'
          \ . '%#StatusWarning#%{statusline#linter("W")}%*'
          \ . '%#StatusError#%{statusline#linter("E")}%*'
          \ . ' %n '
          \ . '%(%#SLModeNormal#%<%{statusline#filename(!&modified)}%*%)'
          \ . '%(%#SLUnsavedFile#%<%{statusline#filename(&modified)}%*%)'
          \ . '%='
          \ . ' %c,%l/%L '
          \ . '%#SLModeNormal# %{&ft} %{&ff} %{&fenc!=""?&fenc:&enc} '
  else
    return
          \   ' %n '
          \ . ' %m%<%f '
          \ . '%='
          \ . ' %{&ft} %{&ff} %{&fenc!=""?&fenc:&enc} '
  end
endfunction

function! statusline#filename(modified) abort
  if a:modified
    let l:fname = expand('%')
    let l:fname = l:fname =~# '^/' ? fnamemodify(l:fname, ':~') : fnamemodify(l:fname, ':.')
    if len(l:fname)
      return printf(' %s ', l:fname)
    else
      return '  [No Name] '
    end
  else
    return ''
  end
endfunction

function! statusline#mode(base) abort
  if a:base == s:currentModeKey()
    return printf('  %s ', a:base)
  else
    return ''
  end
endfunction

function! s:currentModeKey() abort
  return get({
        \ 'n': 'N',
        \ 'v': 'V',
        \ 'V': 'V',
        \ '': 'V',
        \ 'i': 'I',
        \ 'R': 'R',
        \ 'Rv': 'R',
        \ 't': 'T',
        \ 'c': 'C',
        \ 'cv': 'C',
        \ 'ce': 'C',
        \ '!': 'C'
        \ }, mode(), '-')
endfunction

function! statusline#linter(scope) abort
  let l:total = statusline#linter#ale(a:scope) + statusline#linter#coc(a:scope)

  if empty(total)
    return ''
  else
    let l:sign = a:scope ==# 'W' ? g:sign_warning : g:sign_error
    let l:count = l:total > 99 ? '+' : l:total

    return printf('  %s %s ', l:sign, l:count)
  end
endfunction
