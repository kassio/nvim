" Executes a command an keeps
" the current view
function! Preserve(command)
  let _s=@/

  let l:winview = winsaveview()
  silent execute a:command
  call winrestview(l:winview)

  let @/=_s
endfunction

" Executes a global function and keeps
" the current view
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
