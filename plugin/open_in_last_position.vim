aug open_file_in_the_last_position
  au!
  au FileType gitcommit let b:open_at_first_line = 1
  au BufReadPost *
        \ if !exists('b:open_at_first_line') &&
        \    line("'\"") > 0 &&
        \    line("'\"") <= line("$") |
        \   execute 'normal! g`"' |
        \ endif
aug END
