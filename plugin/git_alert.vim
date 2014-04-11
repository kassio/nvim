if !exists('g:git_user_set')
  let g:git_user_set = system("git config --local --get user.email")

  if len(g:git_user_set) == 0
    echoe 'Configure git local email'
  endif
endif
