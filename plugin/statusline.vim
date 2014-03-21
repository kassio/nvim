set laststatus=2

function! ActiveStatuslineBuild()
  let l:stl=""
        \ . <SID>highlighSTL("\ %n\ ", "STLBufferNumber")
        \ . <SID>filenameModifiedAlert()
        \ . <SID>highlighSTL(git#check_user(), "STLErrorAlert")
        \ . <SID>highlighSTL("%=", "STLSeparation")
        \ . SyntasticStatuslineFlag()
        \ . <SID>highlighSTL("\ %r%y[%{&ff}][%{&fenc!=''?&fenc:&enc}][%c,%l/%L]", "STLStats")
  return l:stl
endfunction
set statusline=%!ActiveStatuslineBuild()

function! s:filenameModifiedAlert()
  if &modified
    let highlight="STLWarningAlert"
  else
    let highlight="STLFileName"
  endif
  return <SID>highlighSTL("\ %<%F%m\ ", highlight)
endfunction

function! s:highlighSTL(value, color)
  return "\%#" . a:color . "#" . a:value . "%*"
endfunction

aug statusline_setup
  au!
  au! BufEnter *
        \ if &ft != "qf" |
        \   setlocal statusline< |
        \ endif
  au! BufLeave,WinLeave *
        \ if &ft != "qf" |
        \   setlocal statusline="[%n]%<%F%m%=%r%y[%{&ff}][%{&fenc!=''?&fenc:&enc}][%c,%l/%L]"
        \ endif
aug END
