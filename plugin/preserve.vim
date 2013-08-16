function! Preserve(command)
  let s:_s=@/

  silent normal mz
  silent normal Hmy
  silent normal `z

  silent execute a:command

  silent normal 'yzt
  silent normal `z

  let @/=s:_s
endfunction
