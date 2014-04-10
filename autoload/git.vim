" Based from https://github.com/rafaelfranca/vimfiles
function! git#check_user()
  if !exists('g:git_user_set')
    let g:git_user_set = system("git config --local --get user.email")

    if len(g:git_user_set) == 0
      return ' [Configure git local email] '
    endif
  endif

  return ''
endfunction
