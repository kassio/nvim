" Alert if the local git email is not set
set statusline=
set statusline+=[%n]
set statusline+=\ %<%F
set statusline+=\ %y%r%m
set statusline+=\ %{&fenc!=''?&fenc:&enc}
set statusline+=\ %{&ff}
set statusline+=\ %#error#%{GitEmailAlert()}%*
set statusline+=%=[%c,%l]\ %L
set laststatus=2

" Cloned from github.com/rafaelfranca/vimfiles
function! GitEmailAlert()
  if !exists("g:gitemail_alert")
    let s:email = system("git config --local --get user.email")

    if s:email == ''
      let g:gitemail_alert = '[Configure git local email]'
    else
      let g:gitemail_alert = ''
    endif
  endif

  return g:gitemail_alert
endfunction
