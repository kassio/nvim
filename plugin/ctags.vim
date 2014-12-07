aug ctags
  au!
  au FileWritePost,BufWritePost * silent call system('ctags-once &')
aug END
