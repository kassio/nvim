set laststatus=2

aug build_status_line
  au!
  autocmd VimEnter * set statusline=%!StatuslineBuild()
aug END

function! StatuslineBuild()
  let l:stl=""
        \ . <SID>highlighSTL("\ %n\ ", "STLBufferNumber")
        \ . <SID>highlighSTL("\ %<%F%m\ ", "STLFileName")
        \ . <SID>highlighSTL("\ %r%y", "STLFileData")
        \ . <SID>highlighSTL("[%{&ff}][%{&fenc!=''?&fenc:&enc}]\ ", "STLFileData")
        \ . <SID>highlighSTL(GitEmailAlert(), "STLErrorAlert")
        \ . "%="
        \ . SyntasticStatuslineFlag()
        \ . <SID>highlighSTL("\ %c,%l/%L\ ", "STLStats")
  return l:stl
endfunction

function! s:highlighSTL(value, color)
  return "\%#" . a:color . "#" . a:value . "%*"
endfunction
