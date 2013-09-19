function! s:mapTmuxCmd(...)
  let l:args = split(a:000[0], '\ ')
  let l:key = l:args[0]
  let l:cmd = join(l:args[1:], ' ')
  exe "nnoremap " . l:key . " :normal ,tc,tl<CR>:call SendToTmux(\"" . l:cmd . "\\n\")<CR>"
endfunction

command! -nargs=* MapTmuxCmd call s:mapTmuxCmd(<q-args>)
