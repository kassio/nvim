set laststatus=2

aug build_status_line
  au!
  autocmd VimEnter * set statusline=%!StatuslineBuild()
aug END

function! StatuslineBuild()
  let l:stl=""
        \ . "%2n"
        \ . "\ %<%F%m"
        \ . "\ %r%y"
        \ . "[%{&ff}][%{&fenc!=''?&fenc:&enc}]"
        \ . "%#ErrorMsg#"
        \ . GitEmailAlert()
        \ . "%*"
        \ . "%="
        \ . SyntasticStatuslineFlag()
        \ . "[%c,%l/%L]"
  return l:stl
endfunction
