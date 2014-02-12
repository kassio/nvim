set laststatus=2

aug build_status_line
  au!
  autocmd VimEnter * set statusline=%!StatuslineBuild()
aug END

function! StatuslineBuild()
  let l:stl=""
        \ . <SID>highlighSTL("\ %n\ ", "STLBufferNumber")
        \ . <SID>highlighSTL("\ %r%y[%{&ff}][%{&fenc!=''?&fenc:&enc}]\ ", "STLFileData")
        \ . <SID>filenameModifiedAlert()
        \ . <SID>highlighSTL(GitEmailAlert(), "STLErrorAlert")
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
