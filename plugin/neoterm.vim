if has('nvim')
  let g:neoterm_test_status_format = "  %s "
  let g:neoterm_position = "horizontal"
  let g:neoterm_size = 15
  let g:neoterm_automap_keys = "\<leader>tt"
  let g:neoterm_run_tests_bg = 1
  let g:neoterm_rspec_lib_cmd = "DISABLE_SPRING=1 bin/rspec"

  nnoremap <silent> <leader>rf :TREPLSendFile<cr>
  nnoremap <silent> <leader>rs :TREPLSend<cr>
  vnoremap <silent> <leader>rs :TREPLSend<cr>

  " run set test lib
  nnoremap <silent>  <f8> :call neoterm#test#run('all')<cr>
  nnoremap <silent>  <f9> :call neoterm#test#run('file')<cr>
  nnoremap <silent> <f10> :call neoterm#test#run('current')<cr>
  nnoremap <silent> <f11> :call neoterm#test#rerun()<cr>

  " Useful maps
  " hide all terminals
  nnoremap <silent> <leader>tc :Tclose \| TTestClearStatus<cr>
  " open current terminal
  nnoremap <silent> <leader>to :Topen<cr>
  " clear terminal
  nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
  " kills the current job (send a <c-c>)
  nnoremap <silent> <leader>tk :call neoterm#kill()<cr>
  " exits the last terminal
  nnoremap <silent> <leader>te :T exit \| TTestClearStatus<cr>
  " redo the last bash command
  nnoremap <silent> <leader>tr :call neoterm#clear() \| T !!<cr>
end
