if exists('b:open_last_position_setup_loaded')
  finish
endif
let b:open_last_position_setup_loaded=1

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
