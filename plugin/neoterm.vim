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
  nnoremap <silent> gtc :Tclose \| TTestClearStatus<cr>
  " open current terminal
  nnoremap <silent> gto :Topen<cr>
  " clear terminal
  nnoremap <silent> gtl :call neoterm#clear()<cr>
  " kills the current job (send a <c-c>)
  nnoremap <silent> gtk :call neoterm#kill() \| sleep 100m \| call neoterm#kill()<cr>
  " kills and clears
  nnoremap <silent> gtK :call neoterm#kill() \| sleep 10m \| call neoterm#clear()<cr>
  " exits the last terminal
  nnoremap <silent> gte :T exit \| TTestClearStatus<cr>
  " redo the last bash command
  nnoremap <silent> gtR :call neoterm#clear() \| call neoterm#exec(["!!", "\r"])<cr>
end
