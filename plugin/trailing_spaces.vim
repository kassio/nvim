" Remove trailing spaces and lines
augroup remove_trailling_spaces
  autocmd!
  autocmd BufWritePre * call Preserve('%s/\s\+$//e')
  autocmd BufWritePre * call Preserve('%s/\v($\n\s*)+%$//e')
augroup END
