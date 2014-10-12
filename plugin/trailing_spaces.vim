aug remove_trailing_spaces
  au!
  au BufWritePre * call buffer#trim()
aug END

command! Trim call buffer#trim()
