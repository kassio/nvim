set laststatus=2

function! StatuslineBuild()
  let l:stl=""
        \ . <SID>highlighSTL("\ %n\ ", "STLBufferNumber")
        \ . <SID>highlighSTL("\ %r%y[%{&ff}][%{&fenc!=''?&fenc:&enc}]\ ", "STLFileData")
        \ . <SID>filenameModifiedAlert()
        \ . <SID>highlighSTL(git#check_user(), "STLErrorAlert")
        \ . <SID>highlighSTL("%=", "STLSeparation")
        \ . SyntasticStatuslineFlag()
        \ . <SID>highlighSTL("\ %c,%l/%L\ ", "STLStats")
  return l:stl
endfunction

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
  au! BufEnter * setlocal statusline=%!StatuslineBuild()
  au! BufLeave,WinLeave * setlocal statusline=""
aug END
