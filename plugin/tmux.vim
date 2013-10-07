nmap <leader>tc :call SendKeysToTmux('C-c')<CR>
nmap <leader>tl :call SendKeysToTmux('C-c C-l')<CR>

nmap <leader>tp :call SendKeysToTmux('C-c C-l C-p Enter')<CR>

vmap <leader>ts <Plug>SendSelectionToTmux "rygv :call SendToTmux(@r)<CR>
nmap <leader>ts <Plug>NormalModeSendToTmux vip <Plug>SendSelectionToTmux
nmap <leader>tr <Plug>SetTmuxVars

cabbrev T Tmux

" Command to create a dynamic map to send a command to tmux
" Example:
"   :MapTmuxCmd ,tt mix test
"
" This always create a nnoremap
command! -nargs=* MapTmuxCmd call <SID>mapTmuxCmd(<q-args>)

function! s:mapTmuxCmd(...)
  let l:args = split(a:000[0], '\ ')
  let l:key = l:args[0]
  let l:cmd = join(l:args[1:], ' ')
  exe "nnoremap " . l:key . " :call SendKeysToTmux('C-c C-l')<CR>:call SendToTmux(\"" . l:cmd . "\\n\")<CR>"
endfunction
