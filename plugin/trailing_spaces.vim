let g:keep_trailing_spaces = 0

command! -nargs=? KeepTrailingSpaces
      \ if <q-args> == "" |
      \   let g:keep_trailing_spaces = 1 |
      \ else |
      \   let g:keep_trailing_spaces = str2nr(<q-args>) |
      \ endif

aug remove_trailing_spaces
  au!
  au BufWritePre *
        \ if ! g:keep_trailing_spaces |
        \   call Trim() |
        \ endif
aug END

function! Trim()
  call preserve#preserve('%s/\s\+$//e')
  call preserve#preserve('%s/\v($\n\s*)+%$//e')
endfunction
command! Trim
      \ call Trim()
