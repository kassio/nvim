" Based from https://github.com/rafaelfranca/vimfiles
function! git#check_user()
  if char2nr(system("git status &>/dev/null && echo 1"))
    if !exists('g:git_user_set')
      let g:git_user_set = system("git config --local --get user.email")

      if len(g:git_user_set) == 0
        echoerr 'CONFIGURE GIT LOCAL EMAIL'
      endif
    endif
  endif
endfunction
