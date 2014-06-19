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
  let l:hls = &hls
  setlocal nohls
  call preserve#preserve('%s/\v\s+$//e')
  call preserve#preserve('%s/\v($\n\s*)+%$//e')
  let &hls = l:hls
endfunction
command! Trim call Trim()
