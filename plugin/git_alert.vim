aug git_user_alert
  au!
  au! BufEnter,BufWritePost * call git#check_user()
aug END
