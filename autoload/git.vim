" Based on https://github.com/rafaelfranca/vimfiles
function! git#check_user()
  silent if char2nr(system("git status &>/dev/null && echo 1"))
    if !(exists("g:git_user_set") && g:git_user_set)
      let g:git_user_set = system("git config --local --get user.email")

      if len(g:git_user_set) == 0
        echoh ErrorMsg | echo "CONFIGURE GIT LOCAL EMAIL"
      endif
    endif
  endif
endfunction

function! git#checkout(...)
  if a:0 && (a:1 == '%' || a:1 == '')
    exec '!git checkout ' . expand('%:p')
  else
    exec '!git checkout ' . a:1
  end
  edit
endfunction
