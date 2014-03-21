set laststatus=2

function! ActiveStatuslineBuild()
  let l:stl=""
        \ . <SID>highlighSTL("\ %n\ ", "STLBufferNumber")
        \ . <SID>highlighSTL("\ %t%m\ ", <SID>filenameModifiedColor())
        \ . <SID>highlighSTL(git#check_user(), "STLErrorAlert")
        \ . <SID>highlighSTL("%=", "STLSeparation")
        \ . SyntasticStatuslineFlag()
        \ . <SID>highlighSTL("\ %r%y[%{&ff}][%{&fenc!=''?&fenc:&enc}][%c,%l/%L]", "STLStats")
  return l:stl
endfunction
set statusline=%!ActiveStatuslineBuild()

function! InactiveStatuslineBuild()
  return "[%n]\ %t%m%=%r%y[%{&ff}][%{&fenc!=''?&fenc:&enc}]"
endfunction

function! s:filenameModifiedColor()
  if &modified
    return "STLWarningAlert"
  else
    return "STLFileName"
  endif
endfunction

function! s:highlighSTL(value, color)
  return "\%#" . a:color . "#" . a:value . "%*"
endfunction

aug statusline_setup
  au!
  au! VimEnter,WinEnter,BufWinEnter,FileType,BufUnload,VimResized *
        \ if &ft != "qf" |
        \   set statusline< |
        \ endif
  au! BufLeave,WinLeave *
        \ if &ft != "qf" |
        \   setlocal statusline=%!InactiveStatuslineBuild() |
        \ endif
aug END
