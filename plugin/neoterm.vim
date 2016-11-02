if has('nvim')
  let g:neoterm_test_status_format = "  %s "
  let g:neoterm_position = "horizontal"
  let g:neoterm_automap_keys = "\<leader>tt"
  let g:neoterm_run_tests_bg = 1
  let g:neoterm_use_relative_path = 1

  nnoremap <silent> <leader>trf :TREPLSendFile<cr>
  nnoremap <silent> <leader>trl :TREPLSendLine<cr>
  vnoremap <silent> <leader>trs :TREPLSendSelection<cr>

  " run set test lib
  nnoremap <silent> <leader>tta :call neoterm#test#run("all")<cr>
  nnoremap <silent> <leader>ttf :call neoterm#test#run("file")<cr>
  nnoremap <silent> <leader>ttc :call neoterm#test#run("current")<cr>
  nnoremap <silent> <leader>ttr :call neoterm#test#rerun()<cr>

  " Useful maps
  " hide all terminals
  nnoremap <silent> <leader>tc :Tclose \| TTestClearStatus<cr>
  " open current terminal
  nnoremap <silent> <leader>to :Topen<cr>
  " clear terminal
  nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
  " kills the current job (send a <c-c>)
  nnoremap <silent> <leader>tk :call neoterm#kill() \| sleep 100m \| call neoterm#kill()<cr>
  " kills and clears
  nnoremap <silent> <leader>tK :call neoterm#kill() \| sleep 10m \| call neoterm#clear()<cr>
  " exits the last terminal
  nnoremap <silent> <leader>te :T exit \| TTestClearStatus<cr>
  " redo the last bash command
  nnoremap <silent> <leader>tR :call neoterm#clear() \| call neoterm#exec(["!!", "\r"])<cr>
end
