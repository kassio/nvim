function! Preserve(command)
  let _s=@/

  silent normal mz
  silent normal Hmy
  silent normal `z

  silent execute a:command

  silent normal 'yzt
  silent normal `z

  let @/=_s
endfunction

function! PreserveFN(fn, ...)
  if a:0
    let args = "(".join(a:000, ",").")"
  else
    let args = "()"
  end
  let func = string(function(a:fn))

  call Preserve("let g:preservedReturn = ".func.args)

  return g:preservedReturn
endfunction
