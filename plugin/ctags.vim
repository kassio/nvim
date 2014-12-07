aug ctags
  au!
  au VimEnter * call writefile(["0"], expand("~/.vim_data/retagging"))
  au FileWritePost,BufWritePost * call helpers#retag()
aug END
