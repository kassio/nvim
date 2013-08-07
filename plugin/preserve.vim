" http://technotales.wordpress.com/2010/03/31/preserve-a-vim-function-that-keeps-your-state/
" By Jonathan's Palardy
function! Preserve(command)
  let _s=@/
  normal mz
  normal Hmy
  " Do the business:
  silent execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  normal 'yzt
  normal `z
  delmarks y z
endfunction
