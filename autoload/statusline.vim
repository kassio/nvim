function! statusline#update() abort
  for nr in range(1, winnr('$'))
    let l:filetype = getwinvar(nr, '&filetype')

    if l:filetype =~# 'nerdtree'
      call setwinvar(nr, '&statusline', g:NERDTreeStatusline)
    elseif l:filetype =~# 'help'
      call setwinvar(nr, '&statusline', statusline#help#(winnr() == nr))
    elseif l:filetype =~# 'neoterm'
      call setwinvar(nr, '&statusline', statusline#neoterm#(winnr() == nr))
    else
      call setwinvar(nr, '&statusline', statusline#default(winnr() == nr))
    end
  endfor
endfunction

function! statusline#default(active) abort
  if a:active
    return
          \   '%#SLModeNormal#%{statusline#mode("N")}%*'
          \ . '%#SLModeVisual#%{statusline#mode("V")}%*'
          \ . '%#SLModeInsert#%{statusline#mode("I")}%*'
          \ . '%#SLModeInsert#%{statusline#mode("R")}%*'
          \ . '%#StatusWarning#%{statusline#linter("W")}%*'
          \ . '%#StatusError#%{statusline#linter("E")}%*'
          \ . ' %n '
          \ . '%(%#SLModeNormal#%<%{statusline#filename(!&modified)}%*%)'
          \ . '%(%#SLUnsavedFile#%<%{statusline#filename(&modified)}%*%)'
          \ . '%='
          \ . '%{statusline#git()}'
          \ . ' %c,%l/%L  '
          \ . '%#SLModeNormal#'
          \ . '%{&ft} %{&ff} %{&fenc!=""?&fenc:&enc} '
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
        \ }, mode(), '-')
endfunction

function! statusline#linter(scope) abort
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
    let l:count = l:sign_count > 99 ? printf('%s ', l:sign) : l:sign_count

    return printf('  %s %s ', l:sign, l:count)
  end
endfunction

function! statusline#git() abort
  let l:fname = expand('%')
  let l:command = 'git status -u --porcelain %s 2>/dev/null | cut -b 1-2'
  return substitute(system(printf(l:command, l:fname)), '\_s*', '', 'g')
endfunction
