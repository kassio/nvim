function! s:mapTmuxCmd(...)
  let l:args = split(a:000[0], '\ ')
  let l:key = l:args[0]
  let l:cmd = join(l:args[1:], ' ')
  exe "nnoremap " . l:key . " :call SendKeysToTmux('C-c C-l')<CR>:call SendToTmux(\"" . l:cmd . "\\n\")<CR>"
endfunction

" Command to create a dynamic map to send a command to tmux
" Example:
"   :MapTmuxCmd ,tt mix test
"
" This always create a nnoremap
command! -nargs=* MapTmuxCmd call s:mapTmuxCmd(<q-args>)
