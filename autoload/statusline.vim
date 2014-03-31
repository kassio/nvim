function! statusline#default()
  let stl=""
        \ . statusline#highlight("\ %n\ ", "STLBufferNumber")
        \ . statusline#highlight("\ %t%m\ ", statusline#isFilenameModified())
        \ . statusline#highlight(git#check_user(), "STLErrorAlert")
        \ . statusline#highlight("%=", "STLSeparation")
        \ . SyntasticStatuslineFlag()
        \ . statusline#highlight("\ %r%y[%{&ff}][%{&fenc!=''?&fenc:&enc}][%c,%l/%L]", "STLStats")
  return stl
endfunction

function! statusline#isFilenameModified()
  if &modified
    return "STLWarningAlert"
  else
    return "STLFileName"
  endif
endfunction

function! statusline#highlight(value, color)
  return "\%#" . a:color . "#" . a:value . "%*"
endfunction
