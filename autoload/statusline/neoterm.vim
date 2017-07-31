function! statusline#neoterm#(active) abort
  let l:default =
        \   ' %n '
        \ . '%<%{b:term_title}%*'
        \ . '%= '

  if a:active
    return
          \   '%#SLModeNormal#%{statusline#mode("N")}%*'
          \ . '%#SLModeTerminal#%{statusline#mode("T")}%*'
          \ . l:default
  else
    return l:default
  end
endfunction
