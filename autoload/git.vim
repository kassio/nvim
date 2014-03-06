" Based from https://github.com/rafaelfranca/vimfiles
function! git#check_user()
  if char2nr(system("git status &>/dev/null && echo 1"))
    let l:email = system("git config --local --get user.email")

    if l:email == ''
      return ' [Configure git local email] '
    endif
  endif

  return ''
endfunction
