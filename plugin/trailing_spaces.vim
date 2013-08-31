aug remove_trailling_spaces
  au!
  au BufWritePre * call Preserve('%s/\s\+$//e')
  au BufWritePre * call Preserve('%s/\v($\n\s*)+%$//e')
aug END
