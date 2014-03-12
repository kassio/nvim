aug retag
  au!
  au BufWritePre,FilterWritePre * call system('ctags &>/dev/null &')
aug END
