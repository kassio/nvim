function! Preserve(command)
  let s:_s=@/
  silent normal mz
  silent normal Hmy

  silent execute a:command

  let @/=s:_s
  silent normal 'yzt
  silent normal `z
endfunction
