if has('nvim')
  let g:neoterm_test_status_format = "  %s "
  let g:neoterm_position = "horizontal"
  let g:neoterm_automap_keys = "\<leader>tt"
  let g:neoterm_run_tests_bg = 1
  let g:neoterm_use_relative_path = 1

  nnoremap <silent> <leader>rf :TREPLSendFile<cr>
  nnoremap <silent> <leader>rl :TREPLSendLine<cr>
  vnoremap <silent> <leader>rs :TREPLSendSelection<cr>

  " run set test lib
  nnoremap <silent> <leader>ta :call neoterm#test#run("all")<cr>
  nnoremap <silent> <leader>tf :call neoterm#test#run("file")<cr>
  nnoremap <silent> <leader>tc :call neoterm#test#run("current")<cr>
  nnoremap <silent> <leader>tr :call neoterm#test#rerun()<cr>

  " Useful maps
  " hide all terminals
  nnoremap <silent> <leader>tC :Tclose \| TTestClearStatus<cr>
  " open current terminal
  nnoremap <silent> <leader>to :Topen<cr>
  " clear terminal
  nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
  " kills the current job (send a <c-c>)
  nnoremap <silent> <leader>tk :call neoterm#kill() \| sleep 100m \| call neoterm#kill()<cr>
  " kills and clears
  nnoremap <silent> <leader>tK :call neoterm#kill() \| sleep 10m \| call neoterm#clear()<cr>
end
