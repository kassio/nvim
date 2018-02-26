function! user#after_lint()
  SignifyRefresh
  call statusline#update()
endfunction
