function! statusline#neoterm#(active) abort
  if a:active
    return
          \   '%#SLModeNormal#%{statusline#mode("N")}%*'
          \ . '%#SLModeTerminal#%{statusline#mode("T")}%*'
          \ . ' %n '
          \ . '%<%{get(b:, "term_title", "")}%*'
          \ . '%= '
  else
    return
          \ ' %n '
          \ . '%<%{get(b:, "term_title", "")}%*'
  end
endfunction
