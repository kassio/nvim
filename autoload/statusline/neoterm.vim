function! statusline#neoterm#(active) abort
  if has_key(b:, 'term_title')
    let l:default =
          \   ' %n '
          \ . '%<%{b:term_title}%*'
          \ . '%= '
  else
    let l:default = ''
  end

  if a:active
    return
          \   '%#SLModeNormal#%{statusline#mode("N")}%*'
          \ . '%#SLModeTerminal#%{statusline#mode("T")}%*'
          \ . l:default
  else
    return l:default
  end
endfunction
