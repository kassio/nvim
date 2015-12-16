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
          \   '%1* %{statusline#mode()} %*'
          \ . '%2* %n %*'
          \ . '%(%3*%{statusline#filename(!&modified)}%*%)'
          \ . '%(%4*%{statusline#filename(&modified)}%*%)'
          \ . '%='
          \ . '%#StatusWarning#%{statusline#neomake("W")}%*'
          \ . '%#StatusError#%{statusline#neomake("E")}%*'
          \ . '%#StatusWarning#%{neoterm#test#status("running")}%*'
          \ . '%#StatusSuccess#%{neoterm#test#status("success")}%*'
          \ . '%#StatusError#%{neoterm#test#status("failed")}%*'
          \ . '%3* %y %{&ff} %{&fenc!=""?&fenc:&enc} '
          \ . '%2* %c,%l/%L '
  else
    return
          \   ' %n '
          \ . ' %m%f '
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

function! statusline#mode()
  return get({
        \ 'n': 'Normal',
        \ 'no': 'Pending',
        \ 'v': 'Visual',
        \ 'V': 'V-line',
        \ '': 'V-block',
        \ 's': 'Select',
        \ 'S': 'S-line',
        \ '': 'S-block',
        \ 'i': 'Insert',
        \ 'R': 'Replace',
        \ 'Rv': 'V-Replace',
        \ 't': 'Terminal',
        \ 'c': 'Command',
        \ 'rm': '-- more --',
        \ '!': 'Shell',
        \ }, mode(), '---')
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
