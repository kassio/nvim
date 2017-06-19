if has('nvim')
  let g:neoterm_position = 'horizontal'
  let g:neoterm_automap_keys = '\<leader>tt'
  let g:neoterm_use_relative_path = 1
  let g:neoterm_autoscroll = 1
  let g:neoterm_always_open_to_exec = 0

  command! -complete=shellcmd VTnew
        \ silent call user#neoterm#vertical({-> execute('Tnew') })
  command! -complete=shellcmd VTtoggle
        \ silent call user#neoterm#vertical({-> execute('Ttoggle ') })
  command! -complete=shellcmd -nargs=+ VT
        \ silent call user#neoterm#vertical({-> execute('T '.<q-args>) })

  nnoremap <silent> <leader>rf :TREPLSendFile<cr>
  nnoremap <silent> <leader>rl :TREPLSendLine<cr>
  vnoremap <silent> <leader>rs :TREPLSendSelection<cr>

  " Useful maps
  nnoremap <silent> <leader>tt :Ttoggle<cr>:call neoterm#normal('G')<cr>
  nnoremap <silent> <leader>vt :VTtoggle<cr>:call neoterm#normal('G')<cr>
  " send the exist command to the current terminal
  nnoremap <silent> <leader>te :T exit<cr>
  " send the exist command to the current terminal
  nnoremap <silent> <leader>tG :call neoterm#normal('G')<cr>
  " clear terminal
  nnoremap <silent> <leader>tl :call user#neoterm#clear()<cr>
  nnoremap <silent> <leader>tL :call user#neoterm#hardclear()<cr>
  " kills the current job (send a <c-c>)
  nnoremap <silent> <leader>tk :call neoterm#kill() \| sleep 100m \| call neoterm#kill()<cr>
  " kills and clears
  nnoremap <silent> <leader>tK :call neoterm#kill() \| sleep 10m \| call neoterm#clear()<cr>
end
